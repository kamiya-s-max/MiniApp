class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(text: params[:text])
    redirect_to action: :index
  end

  private
  def post_params
    params.permit(:text, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
