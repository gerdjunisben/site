class MainController < ApplicationController
  def index
    @posts = Post.all
  end

  def about
  end
end
