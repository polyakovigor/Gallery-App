class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: true
end
