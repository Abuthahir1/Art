class LoginsController < ApplicationController
  layout 'application', :except => [:new]
  def new
  
  	@user = User.new
  end

  def create
  	user = User.find_or_create_by!(email: params[:user][:email])

  	    user.update!(login_token: SecureRandom.urlsafe_base64,
      login_token_valid_until: Time.now + 5.minutes)

  	url = sessions_create_url(login_token: user.login_token)

  	LoginMailer.send_email(user,url).deliver_later

  	redirect_to root_path, notice: "Login link sent to your email"
  end
end
