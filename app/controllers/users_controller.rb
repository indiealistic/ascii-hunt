class UsersController < ApplicationController
 before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params # save user as an object before it's written to the server to check for duplicate submissions or other errors with the form
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user
  end

  def show
    @user = User.find params[:id]
    @beets = Beet.all
    @likes = Like.all
    @like_new = Like.new
    @comments = Comment.all
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :bio, :password, :password_confirmation)
  end
end
