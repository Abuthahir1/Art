class SessionsController < ApplicationController
  def create
  	 user = User.where(login_token: params[:login_token]).where('login_token_valid_until > ?', Time.now).first

  	 if user
  	 	user.update!(login_token:nil,login_token_valid_until: 5.minutes)
  	 	auto_login(user)
  	 	redirect_to root_path, notice:"Congrats. You are signed in!"
  	 else
  	 	redirect_to root_path, alert: 'Invalid or expired login link'
  	 end
  end

  def destroy
  	logout

  	redirect_to root_path, notice: 'You are signed out'
  end
end
