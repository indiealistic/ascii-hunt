class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def new
    @beets = Beet.all
    @likes = Like.all
    @like = Like.new
  end

  def create
    @likes = Like.all
    like = Like.create like_params
    beet = like.beet
    redirect_to root_path(anchor: "#{beet.id}")
  end

  def show
  end

  def destroy
    beet = params[:beet_id]
    user = params[:user_id]
    like = Like.where(beet_id: beet, user_id: user)
    like.destroy_all
    redirect_to root_path(anchor: beet)
  end

  private
  def like_params
    params.require(:like).permit(:beet_id, :user_id)
  end
end
