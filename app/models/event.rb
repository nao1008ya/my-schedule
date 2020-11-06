class Event < ApplicationRecord
  
  validates :title, presence: true

  # アソシエーションを設定
  belongs_to :user
  belongs_to :group
end
