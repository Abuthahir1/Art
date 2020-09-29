class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_class
  	User
  end

  def not_authenticated
  	redirect_to root_path, alert: "Not anthenticated"
  end

end
