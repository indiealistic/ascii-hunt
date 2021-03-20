class PagesController < ApplicationController

  def home
    @shits = Shit.all
    @likes = Like.all
    @comments = Comment.all
    @like_new = Like.new
  end

  def clipboard
    shit = Shit.find params[:id]
    IO.popen("pbcopy", "w") { |clipboard| clipboard.puts shit.content }
  end

end
