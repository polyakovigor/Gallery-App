class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]
  before_action :set_image, only: [ :create, :destroy ]

  def create
    Like.create(:image => @image, :user => current_user)
    respond_to do |format|
      format.html {  }
      format.js {  }
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    respond_to do |format|
      format.html {  }
      format.js {  }
    end
  end

  private

  def set_image
    @image = Image.where(id: params[:id]).first
  end
end
