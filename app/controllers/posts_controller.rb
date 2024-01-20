class PostsController < ApplicationController
  def index
    @posts = set_user.posts
  end

  def show
    # specific posts
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @set_post ||= @user.posts.find(params[:id])
  end
end
