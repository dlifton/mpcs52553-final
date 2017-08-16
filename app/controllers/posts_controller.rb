class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create( post_params )
  end

  def post_params
    params.require(:post).permit(:image)
  end

  def show
    @post = Post.find_by(id: params['id'])
  end
end