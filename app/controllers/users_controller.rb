class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    current_user
  end
end