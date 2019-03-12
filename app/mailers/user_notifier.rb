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
    @user = user
    # assign message body to instance variable to be passed to views/user_notifier/send_contract_email.html.erb
    @message_to_recipient = message_to_recipient
    # p "!!!!!! @message_to_recipient " + @message_to_recipient.to_s
    path_file_object.keys.each do |each_key|
      # file = File.open(path_file_object[each_key], "rb")
      # attachments[each_key.to_s] = file.read
      file = File.open(path_file_object[each_key])
      # Make sure to add .pdf or file extension at end of file name or browser will not read it
      attachments["#{each_key.to_s}.pdf"] = File.read(path_file_object[each_key])
    end
    test_from = 'testfromemail@email.com'
    # attachments["combined.pdf"] = File.read(path)
    # Assign array of email addresses in cc and bcc
    # mail( :to => tenant_user_email, cc: user_email, :subject => email_subject )
    mail( :from => test_from, :to => tenant_user_email, :cc => cc_array, :bcc => bcc_array, :subject => email_subject )
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
