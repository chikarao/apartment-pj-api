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

  def send_contract_email(path_file_object, user)
    # @user = user
    path_file_object.keys.each do |each_key|
      p "each_key path_file_object[each_key]: " + each_key.to_s + " " + path_file_object[each_key].to_s
      # file = File.open(path_file_object[each_key], "rb")
      # attachments[each_key.to_s] = file.read
      # file = File.open(path_file_object[each_key], "rb")
      attachments[each_key.to_s] = File.read(path_file_object[each_key])
    end
    mail( :to => 'chikara@gmail.com', :subject => 'Here are the booking documents!' )
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
