class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  after_save :update_post_counter
  def recent_comments_return
    comments.order(created_at: desc).include(author).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:postsCounter)
  end
end
