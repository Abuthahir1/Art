class UsersController < ApplicationController
	before_action :require_login, only:[:edit,:update]
  def index
  end

  def edit
  end

  def update
  	current_user.update! user_params
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:first_name,:last_name,:category)
  end
end
