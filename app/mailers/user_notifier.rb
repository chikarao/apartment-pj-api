class UserNotifier < ActionMailer::Base
  default :from => 'flatsandflats@flats.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for signing up!' )
  end
end
