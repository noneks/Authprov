class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.all
  end

	def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if @picture.save
      redirect_to "/users/profile"
    else
      erb :"welcome/index"
    end
  end

  def show
    @pictures = current_user.pictures
  end

  private 

  def picture_params
    params.require(:picture).permit(:pic)
  end
end
