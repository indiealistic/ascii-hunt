class ShitsController < ApplicationController

  def index
    @shits = Shit.all
  end

  def new
    @shit = Shit.new
  end

  def create
    shit = Shit.create :title => params[:shit][:title], :tags => params[:shit][:tags], :user_id => @current_user.id
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      shit.image = req["public_id"] # store the Cloudinary link in the image column
      shit.content = AsciiGen.new(Cloudinary::Utils.cloudinary_url(req["public_id"])).to_ascii_art(width: 70)
      shit.save
    end
    redirect_to root_path # show the shit detail page
  end

  def edit
    @shit = Shit.find params[:id]
  end

  def update
    shit = Shit.find params[:id]
    shit.update shit_params
    redirect_to shit # redirect back to the shit page
  end

  def show
    @shit = Shit.find params[:id]
    @user = @shit.user
    @comments = @shit.comments
    @comment_new = Comment.new
    @likes = Like.all
    @like_new = Like.new
  end

  def destroy
    shit = Shit.find params[:id]
    shit.destroy
    redirect_to root_path # redirect back to the index
  end

  def clipboard
    shit = Shit.find params[:id]
    IO.popen("pbcopy", "w") { |clipboard| clipboard.puts shit.content }
  end

  private
  def shit_params # setup of strong params
    params.require(:shit).permit(:title, :tags, :content, :image, :like_count, :comment_count, :user_id)
  end
end
