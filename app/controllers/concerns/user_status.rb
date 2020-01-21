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
    p "************** in UserStatus module user_status before unless: " + user_status.to_s
    # p "************** in UserStatus module user_status before unless user_hash_kv: " + user_hash_kv.to_s
    # keys returns an array, so test for first element
    # if user_status does not exist set a new hash for user with loggedin and onLine to true (1) or (0) for logged out or not online
    logged_in = hash[:logged_in] ? 1 : 0
    online = hash[:online] ? 1 : 0
    # p "************** in UserStatus module user_status before unless logged_in: " + logged_in.to_s
    # p "************** in UserStatus module user_status before unless online: " + online.to_s
    unless user_status[0]
      # the hash keys have code. ':1' is user id; ',1' is log in status (1 for yes, NOT incremented for multiple logins since sessions controllers
      # generates a new token after a logout, so a new login in another machine would get the same token as another manchine, but if one machine is logged signed out,
      #  the other machine would not be able to validate with the token it has)
      # ':1 for online or not' This is so that they can be searched using $redis.keys function
      user_status_created = $redis.hmset("user_status:#{hash[:user_id]},#{logged_in};#{online}", "last_activity", (Time.now.to_f * 1000).to_i)
    else
      # if user_status DOES exist for user, delete the current user_status and create a new hash with last_activity: current time in # of millisconds since epoch
      $redis.del(user_status[0])
      user_status_created = $redis.hmset("user_status:#{hash[:user_id]},#{logged_in};#{online}", "last_activity", (Time.now.to_f * 1000).to_i)
      # p "************** in UserStatus module last_activity: " + last_activity.to_s
    end
    # return true if write of user_status is OK
    return user_status_created == 'OK'
  end
  # called in eg flats#show when user opens flat show page to get whether flat owner is online 
  def get_user_status(user_id)
    # .keys return array of keys for hashes
    user_status = $redis.keys(pattern = "*:#{user_id},*")
    # p "*************redis module UserStatus, user_status: " + user_status.to_s
    # .hget returns a string; convert to integer
    last_activity = $redis.hget(user_status[0], "last_activity").to_i
    # p "*************redis module UserStatus, last_activity: " + last_activity.to_s
    # returns string 1 for yes or 0 no; convert to integer
    logged_in = user_status[0][user_status[0].index(',') + 1].to_i;
    # p "*************redis module UserStatus, logged_in: " + logged_in.to_s
    # returns string 1 for yes or 0 no; convert to integer
    online = user_status[0][user_status[0].index(';') + 1].to_i;
    # p "*************redis module UserStatus, online: " + online.to_s
    if user_status[0]
      user_status_hash = {user_id: @flat.user_id, logged_in: logged_in, online: online, last_activity: last_activity}
    else
      # return nil if no user status in redis for user
      return nil
    end
      return user_status_hash
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
