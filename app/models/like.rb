class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: true

  validates_uniqueness_of :likes_count, scope: [ :image_id, :user_id]
end
