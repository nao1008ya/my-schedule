class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_time, presence: true
  # アソシエーションを設定
  belongs_to :user
end
