class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit ]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, alert: "Post was successfully updated."
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, alert: "Post was successfully deleted."
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :preview_image)
  end
end
