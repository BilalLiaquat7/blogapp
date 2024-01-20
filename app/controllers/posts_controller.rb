class PostsController < ApplicationController
  def index
    @posts = set_user.posts
  end

  def show
    # specific posts
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)
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
