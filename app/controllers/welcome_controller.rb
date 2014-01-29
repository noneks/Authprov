class WelcomeController < ApplicationController
  def index
  end

  def update
  	@user = User.find(params[:id])
    @user.update_attribute(:picture, params[:user][:picture])
    redirect_to users_index
  end

end
