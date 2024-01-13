class Comment < ApplicationRecord
  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:commentssCounter)
  end
end
