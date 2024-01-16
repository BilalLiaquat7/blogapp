class PostsController < ApplicationController
  def index
    @posts = users.posts
  end

  def show
    # specific posts
  end
end
