class UsersController < ApplicationController
  def index
    # it'll show all users
  end

  def show
    # it'll show users
  end

  def set_users
    @set_users ||= User.includes(:posts).all
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:id])
    @recent_posts = @set_user.recent_posts
  end
end
