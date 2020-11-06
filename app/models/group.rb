class Group < ApplicationRecord

  validates :name, presence: true

  # アソシエーションを設定
  has_many :events
  # has_many :users, through: :group_users
end
