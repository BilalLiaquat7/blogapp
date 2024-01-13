class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  after_save :update_like_counter

  # A method that updates the likes counter for a post.
  def update_like_counter
    likes.increment!(:likesCounter)
  end

end
