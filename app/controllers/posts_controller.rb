class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new

    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to main_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :preview_image)  
  end
end
