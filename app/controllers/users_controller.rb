class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    current_user
  end
  
  def destroy
  	user.destroy

  	redirect_to welcome_index
  end
end