class UserNotifier < ActionMailer::Base
  default :from => 'flatsandflats@flats.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_password_forgot_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Here is your password reset token.' )
  end
  def send_registration_confirmation_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Please confirm email!' )
  end

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for signing up!' )
  end
end
