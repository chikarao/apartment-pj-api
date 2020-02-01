module UserStatus
  def set_last_user_activity(hash)
  #  {:user_id=>1, :logged_in=>true, :online=> true}
  # needs to be symbols when called
    # get user status for user from redis, if exists; if not one is created in unless
    # user id is preceded by ':' colon and followed by ',' comma
    user_status = $redis.keys(pattern = "*:#{hash[:user_id]},*")
    # user_hash_kv = $redis.hget(user_status[0], 'last_activity')
    # >>> returns string
    # user_hash_kv = $redis.hgetall(user_status[0])
    # >>> return array
    # p "************** in UserStatus module user_status before unless: " + user_status.to_s
    # keys returns an array, so test for first element
    # if user_status does not exist set a new hash for user with loggedin and onLine to true (1) or (0) for logged out or not online
    # online and logged_in passed true or false; store 1 or 0 in online to make easier to create hash key
    logged_in = hash[:logged_in] ? 1 : 0
    online = hash[:online] ? 1 : 0
    # if user already has a status hash in redis
    if user_status[0]
      # keep_online_status means if user has chosen to be offline, and when there is a status on redis,
      # the status is set with the same online status as before
      if hash[:keep_online_status]
        online = user_status[0][user_status[0].index(';') + 1].to_i;
      end
      # if user_status DOES exist for user, delete the current user_status and create a new hash with last_activity: current time in # of millisconds since epoch
      user_status.each do |each_status|
        $redis.del(each_status)
      end
      user_status_created = $redis.hmset("user_status:#{hash[:user_id]},#{logged_in};#{online}", "last_activity", (Time.now.to_f * 1000).to_i)
    # if else user does not have a user hash in redis create one
    else
      # the hash keys have code. ':1' is user id; ',1' is log in status (1 for yes, NOT incremented for multiple logins since sessions controllers
      # generates a new token after a logout, so a new login in another machine would get the same token as another manchine, but if one machine is logged signed out,
      #  the other machine would not be able to validate with the token it has)
      # ':1 for online or not' This is so that they can be searched using $redis.keys function
      user_status_created = $redis.hmset("user_status:#{hash[:user_id]},#{logged_in};#{online}", "last_activity", (Time.now.to_f * 1000).to_i)
    end
    # return true if write of user_status is OK
    return user_status_created == 'OK'
  end
  # called in eg flats#show when user opens flat show page to get whether flat owner is online
  def get_user_status_by_user_id(user_id)
    # .keys return array of keys for hashes
    user_status = $redis.keys(pattern = "*:#{user_id},*")
    # .hget returns a string; convert to integer
    if user_status[0]
      last_activity = $redis.hget(user_status[0], "last_activity").to_i
      # p "************** in UserStatus module get_user_status_by_user_id user_status[0]: " + user_status[0].to_s
      # returns string 1 for yes or 0 no; convert to integer
      logged_in = user_status[0][user_status[0].index(',') + 1].to_i;
      # returns string 1 for yes or 0 no; convert to integer
      online = user_status[0][user_status[0].index(';') + 1].to_i;
      user_status_hash = {user_id: user_id, logged_in: logged_in, online: online, last_activity: last_activity}
    else
      # return nil if no user status in redis for user
      return nil
    end
      return user_status_hash
  end

  def set_connections(connection_hash)
    # function set_connections creates a hash in redis in the form of 'connection,1,2,'
    # 'connection' idetifies a hash representing a connection between users, and time connection established as a value to the key
    # comman in between users will allow for calling split(',') on the string key
    # hash as users, an array, and expiration an integer for seconds in which hash will expire
    # get an existing key in redis. returns array which is empty if none exists
    connection = $redis.keys(pattern = "*,#{connection_hash[:user_ids][0]},*")
    # test for existing connection
    if connection[0]
      # if connection exists, delete it before creating a new
      # $redis.del(connection[0])
      connection.each do |each_connection|
        $redis.del(each_connection)
      end
      # create a string to represent the hey to the hash in redis, passing an array of user ids
      users_string = create_string(connection_hash[:user_ids])
      # call redis method to create hash with time stamp
      connection_created = $redis.hmset("connection#{users_string}", "time_connected", (Time.now.to_f * 1000).to_i)
      # set expiration of the key that is tied to the disconnect time passed from the front end disconnetTime in actionCableManager
      # the key will expire and be deleted in x seconds. Can check time to live redis.ttl(key)
      expiration_set = $redis.expire("connection#{users_string}", connection_hash[:expiration])
    else
      # users_string = ','
      users_string = create_string(connection_hash[:user_ids])
      connection_created = $redis.hmset("connection#{users_string}", "time_connected", (Time.now.to_f * 1000).to_i)
      expiration_set = $redis.expire("connection#{users_string}", connection_hash[:expiration])
      # p "*************redis module UserStatus, set_connections connection_created, expiration_set: " + connection_created.to_s + ' ' + expiration_set.to_s
    end
    return connection_created == "OK" && expiration_set
  end

  def update_connections(connection_hash)
    # function update_connections updates the expiration a hash in redis in the form of 'connection,1,2,'
    # 'connection' idetifies a hash representing a connection between users, and time connection established as a value to the key
    # a comma in between users will allow for calling split(',') on the string key
    # hash as users, an array, and expiration an integer for seconds in which hash will expire
    # get an existing key in redis. returns array which is empty if none exists
    connection = $redis.keys(pattern = "*,#{connection_hash[:user_ids][0]},*")
    # test for existing connection
    if !connection.empty?
      # if connection exists, delete it before creating a new
      # $redis.del(connection[0])
      connection.each do |each_connection|
        # set the expiration to one passed in connection_hash
        expiration_set = $redis.expire(each_connection, connection_hash[:expiration])
      end
      # if there is no connection,
      # # create a string to represent the hey to the hash in redis, passing an array of user ids
      # users_string = create_string(connection_hash[:user_ids])
      # # call redis method to create hash with time stamp
      # connection_created = $redis.hmset("connection#{users_string}", "time_connected", (Time.now.to_f * 1000).to_i)
      # # set expiration of the key that is tied to the disconnect time passed from the front end disconnetTime in actionCableManager
      # # the key will expire and be deleted in x seconds. Can check time to live redis.ttl(key)
      # expiration_set = $redis.expire("connection#{users_string}", connection_hash[:expiration])
    else
      # users_string = ','
      users_string = create_string(connection_hash[:user_ids])
      connection_created = $redis.hmset("connection#{users_string}", "time_connected", (Time.now.to_f * 1000).to_i)
      expiration_set = $redis.expire("connection#{users_string}", connection_hash[:expiration])
      # p "*************redis module UserStatus, set_connections connection_created, expiration_set: " + connection_created.to_s + ' ' + expiration_set.to_s
    end
    return connection_created == "OK" && expiration_set
  end

  def send_notification_to_other_users(user_id)
    # function called to send status change of current user to other connected users
    # eg flat owners who are connected via chat with the user has a "connection,1,2" type hash with a time stamp
    # and set with a ttl expiration for the duration of the current user's disconnect time
    # connection is an array with connections the user has as discussed above
    # get keys with 'connection' and ',user_id'
     connection = $redis.keys("connection*,#{user_id}*")
     # connectin will be like ["connection,2,3", "connection,2,4", "connection,5,2"]
     # !!!!!!!own messaging room just for testing
     # others_user_address_array = ["messaging_room_#{user_id}"]
     others_user_address_array = []
     #iterate through connections
     connection.each do |eachConnection|
       connection_split_array = []
       # assuming splits the array like ['connection', '1', '2', '3']
       connection_split_array = eachConnection.split(',')
       # Do not need to pop to remove last element in array
       # connection_split_array.pop
       p '******* redis in user_status send_notification_to_other_users connection_split_array: ' + connection_split_array.to_s
       connection_split_array.each_with_index do |each, i|
         # push into array ids (messagin room name) not the connection which is index 0
         if i > 0 && each.to_s != user_id.to_s
           others_user_address_array.push("messaging_room_#{each}")
         end
       end
     end
     # p '******* redis in user_status send_notification_to_other_users user_id: ' + user_id.to_s
     # p '******* redis in user_status send_notification_to_other_users connection: ' + connection.to_s
     p '******* redis in user_status send_notification_to_other_users others_user_address_array: ' + others_user_address_array.to_s
     user_status = get_user_status_by_user_id(user_id)

     # Send to other users current user's status in an array to process as other_user_status
     if user_status
       ChatMessageCreationEventBroadcastJob.perform_later({:notification => "others_user_status_change", user_status: user_status ? [user_status] : []}, others_user_address_array)
     end
  end

  private

  def create_string(array)
    # create string to be passed to hmset
    # initial string needs a comma so user id can be added then add another comma after id
    string = ','
    array.each_with_index do |each, i|
      string.concat(each.to_s)
      # add a comma bofore AND after each user id
      # if i < array.length - 1
        # insert a common infront of all user ids except after the last id
        string.concat(',')
      # end
    end
    return string
  end

  # def authenticate_with_token
  #   return if current_user
  #   json_response "Unauthorized request", false, {}, :unauthorized
  # end
  #
  # def correct_user user
  #   user_id == current_user_id
  # end
end
