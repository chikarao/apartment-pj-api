module Progress

  def send_progress_percentage(p)
    p '****** send_progress_percentage, user_id, percentage: ' + p[:user_id].to_s + ' ' + p[:percentage].to_s

     if p[:user_id]
       ProgressCreationEventBroadcastJob.perform_now({:notification => "progress", :progress_percentage => p[:percentage], :message => p[:message], :time => p[:time]}, "messaging_room_#{p[:user_id]}")
     end
  end

  # private
  #
  # def create_string(array)
  #   # create string to be passed to hmset
  #   # initial string needs a comma so user id can be added then add another comma after id
  #   string = ','
  #   array.each_with_index do |each, i|
  #     string.concat(each.to_s)
  #     # add a comma bofore AND after each user id
  #     # if i < array.length - 1
  #       # insert a common infront of all user ids except after the last id
  #       string.concat(',')
  #     # end
  #   end
  #   return string
  # end
  #
  # # def authenticate_with_token
  # #   return if current_user
  # #   json_response "Unauthorized request", false, {}, :unauthorized
  # # end
  # #
  # # def correct_user user
  # #   user_id == current_user_id
  # # end
end
