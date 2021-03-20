class BeetsController < ApplicationController

  def index
    @beets = Beet.all
  end

  def new
    @beet = Beet.new
  end

  def create
    beet = Beet.create :title => params[:beet][:title], :tags => params[:beet][:tags], :user_id => @current_user.id
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      beet.image = req["public_id"] # store the Cloudinary link in the image column
      beet.content = AsciiGen.new(Cloudinary::Utils.cloudinary_url(req["public_id"])).to_ascii_art(width: 70)
      beet.save
    end
    redirect_to root_path # show the beet detail page
  end

  def edit
    @beet = Beet.find params[:id]
  end

  def update
    beet = Beet.find params[:id]
    beet.update beet_params
    redirect_to beet # redirect back to the beet page
  end

  def show
    @beet = Beet.find params[:id]
    @user = @beet.user
    @comments = @beet.comments
    @comment_new = Comment.new
    @likes = Like.all
    @like_new = Like.new
  end

  def destroy
    beet = Beet.find params[:id]
    beet.destroy
    redirect_to root_path # redirect back to the index
  end

  def clipboard
    beet = Beet.find params[:id]
    IO.popen("pbcopy", "w") { |clipboard| clipboard.puts beet.content }
  end

  private
  def beet_params # setup of strong params
    params.require(:beet).permit(:title, :tags, :content, :image, :like_count, :comment_count, :user_id)
  end
end
