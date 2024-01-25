class PostsController < ApplicationController
  before_action :set_user
  def index
    @user = @set_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author.id
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(author_id: @user.id, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      redirect_to user_posts_path(@post.author.id)
    else
      render :new
    end
  end

  def new
    @user = current_user
  end

  private

  def set_user
    @set_user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @set_post ||= @user.posts.find(params[:id])
  end
end
