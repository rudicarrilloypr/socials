class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_create :update_likes_counter!
  after_create :update_likes_counter!
  after_destroy :update_likes_counter!
  def update_likes_counter!
    post.update(likes_counter: post.likes.count)
  end
end
