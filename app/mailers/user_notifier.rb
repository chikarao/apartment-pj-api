class UserNotifier < ActionMailer::Base
  default :from => 'flatsandflats@flats.com'

  # layout "mailer"

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_password_forgot_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Here is your password reset token.' )
  end

  def send_registration_confirmation_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Please confirm email!' )
  end

  # def send_signup_email(user)
  #   @user = user
  #   mail( :to => @user.email, :subject => 'Thank you for signing up!' )
  # end

  # def send_contract_email(path_file_object, user)
  def send_contract_email(path_file_object, user, user_email, tenant_user_email, email_subject, cc_array, bcc_array, message_to_recipient)
    # @user = user
    @message_to_recipient = message_to_recipient
    p "!!!!!! @message_to_recipient " + @message_to_recipient.to_s

    path_file_object.keys.each do |each_key|
      # p "!!!!!!each_key path_file_object[each_key]: " + each_key.to_s + " " + path_file_object[each_key].to_s
      # file = File.open(path_file_object[each_key], "rb")
      # attachments[each_key.to_s] = file.read
      file = File.open(path_file_object[each_key])
      # p "file : " + file.to_s
      # p "!!!!!path: " + path.to_s
      attachments["#{each_key.to_s}.pdf"] = File.read(path_file_object[each_key])
    end

    # cc_array.each do |each_cc|
    #   :cc => each_cc
    #   p "!!!!!cc: " + cc.to_s
    # end

    cc_array.push(user_email);

    # bcc_array.each do |each_bcc|
    #   :bcc => each_bcc
    #   p "!!!!!bcc: " + bcc.to_s
    # end
    # attachments["combined.pdf"] = File.read(path)
    # mail( :to => tenant_user_email, cc: user_email, :subject => email_subject )
    mail( :to => tenant_user_email, :cc => cc_array, :bcc => bcc_array, :subject => email_subject )
    # mail( :to => @user.email, :subject => 'Here are the booking documents!' )
    return true;
  end
end

# class ApplicationMailer < ActionMailer::Base
#   def welcome(recipient)
#     attachments['free_book.pdf'] = File.read('path/to/file.pdf')
#     mail(:to => recipient, :subject => "New account information")
#   end
# end
