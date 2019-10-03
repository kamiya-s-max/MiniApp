class PostsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(text: post_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    redirect_to action: :index    
  end

  def destroy
    post = Post.destroy(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
