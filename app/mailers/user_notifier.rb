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

  def send_contract_email(path, user)
    # @user = user
    attachments['combined.pdf'] = File.read(path)
    mail( :to => @user.email, :subject => 'Here is the contract!' )
  end
end

# class ApplicationMailer < ActionMailer::Base
#   def welcome(recipient)
#     attachments['free_book.pdf'] = File.read('path/to/file.pdf')
#     mail(:to => recipient, :subject => "New account information")
#   end
# end
