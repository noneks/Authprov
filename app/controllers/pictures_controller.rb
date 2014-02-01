class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.all
  end

	def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if @picture.save
      redirect_to "/users/picture"
    else
      erb :"welcome/index"
    end
  end

  def show
    @picture = Picture.find(params[current_user])
  end

  private 

  def picture_params
    params.require(:picture).permit(:pic)
  end
end
