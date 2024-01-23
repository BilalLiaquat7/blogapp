class PostsController < ApplicationController
  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    # specific posts
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

  private

  def set_user
    @set_user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @set_post ||= @user.posts.find(params[:id])
  end
end
