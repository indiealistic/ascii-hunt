class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def new
    @shits = Shit.all
    @likes = Like.all
    @like = Like.new
  end

  def create
    @likes = Like.all
    like = Like.create like_params
    shit = like.shit
    redirect_to root_path(anchor: "#{shit.id}")
  end

  def show
  end

  def destroy
    shit = params[:shit_id]
    user = params[:user_id]
    like = Like.where(shit_id: shit, user_id: user)
    like.destroy_all
    redirect_to root_path(anchor: shit)
  end

  private
  def like_params
    params.require(:like).permit(:shit_id, :user_id)
  end
end
