class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commentssCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter
  def recent_comments
    # comments.order(created_at: :desc).limit(5)
    "osme"
  end

  private

  def update_post_counter
    author.increment!(:postsCounter)
  end
end
