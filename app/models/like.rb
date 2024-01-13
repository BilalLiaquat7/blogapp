class Like < ApplicationRecord
  after_save :update_like_counter

  # A method that updates the likes counter for a post.
  def update_like_counter
    likes.increment!(:likesCounter)
  end
end
