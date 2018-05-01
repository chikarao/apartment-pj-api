class Api::V1::PasswordsController < ApplicationController
  # params in postman is just email and password, not user[email]
  def forgot
   if params[:email].blank?
     # return render json: {error: 'Email not present'}
     return json_response "Email not present.", false, {}, :bad_request
   end

   @user = User.find_by(email: params[:email].downcase)

   if @user.present? && @user.email_confirmed?
     # !!!!!!!!!!!!!!!!!
     @user.generate_password_token!
     # SEND EMAIL HERE
     UserNotifier.send_password_forgot_email(@user).deliver

     json_response "Email with password reset token sent.", true, {user: @user}, :ok

     # render json: {status: 'ok'}, status: :ok
   else
     json_response "Cannot find email",  false, {}, :failure
     # render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
   end
 end

 def reset
   token = params[:token].to_s
   p "here is the token: " + token
   p "here is the email: " + params[:email]

   if params[:email].blank?
     return json_response "Email not present.", false, {}, :bad_request
     # return render json: {error: 'Token not present'}
   end

   @user = User.find_by(email: params[:email])
   # Cannot find by reset_password_token, for some reason!!!!!
   # @user = User.find_by(reset_password_token: token)
   p "here is the @user.present?: " + @user.present?.to_s
   p "Is the token valid? " + @user.password_token_valid?.to_s

   if @user.present? && @user.password_token_valid?
     if @user.reset_password!(params[:password])
       # render json: {status: 'ok'}, status: :ok
       json_response "Password reset successfully.", true, {user: @user}, :ok
     else
       json_response "Unable to save password.", false, {}, :unprocessable_entity
       # render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
     end
   else
     # render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
     json_response "Link not valid or expired. Try generating a new link.", false, {}, :unprocessable_entity
   end
 end

 private
 def user_params
   params.require(:user).permit(:email)
 end
end
