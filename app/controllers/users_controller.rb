class UsersController < ApplicationController
  def index
    set_users.includes(:posts)
  end

  def show
    @set_user ||= User.includes(:posts).find(params[:id])
    @recent_posts = @set_user.most_recet_posts
  end

  def set_users
    @set_users ||= User.includes(:posts).all
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:id])
    @recent_posts = @set_user.most_recet_posts
  end
end
