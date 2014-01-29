class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    current_user
  end

  def update
    @user = User.update_attribute( user_params )
  end

  
   def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to users_index_path
   end
end