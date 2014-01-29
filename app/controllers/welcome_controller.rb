class WelcomeController < ApplicationController
  def index
  end

  def update
  	@user = User.find(params[:id])
    @user.update_attribute(:picture, params[:user][:picture])
  end

end
