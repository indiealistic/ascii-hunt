class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create comment_params
    redirect_to request.referrer
  end

  def destroy
    beet = params[:beet_id]
    user = params[:user_id]
    comment_id = params[:id]
    comment = Comment.where(id: comment_id, beet_id: beet, user_id: user)
    comment.destroy_all
    redirect_to request.referrer
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :beet_id, :user_id)
  end
end
