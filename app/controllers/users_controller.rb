class UsersController < ApplicationController
  before_action :set_users, only: [:index]
  # before_action :set_user,  only: [:show]
  def index
    # @users is already set by the `set_users` method
  end

  def show
    @set_user ||= User.includes(:posts).find(params[:id])
    @most_recet_posts = @set_user.most_recet_posts
  end

  def set_users
    @set_users ||= User.includes(:posts).all
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:id])
    @most_recet_posts = @set_user.most_recet_posts
  end
end
