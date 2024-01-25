class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:commentssCounter)
  end

  def recent_comments
    post.comments.order(created_at: :desc).limit(5)
  end
end
