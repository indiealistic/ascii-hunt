class PagesController < ApplicationController
  def home
    @beets = Beet.all
    @likes = Like.all
    @comments = Comment.all
    @like_new = Like.new
  end

  def clipboard
    beet = Beet.find params[:id]
    IO.popen("pbcopy", "w") { |clipboard| clipboard.puts beet.content }
  end
end
