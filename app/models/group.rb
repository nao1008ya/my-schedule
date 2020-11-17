class Group < ApplicationRecord

  validates :name, presence: true

  # アソシエーションを設定
  has_many :events
  has_many :group_users
  has_many :users, through: :group_users, dependent: :destroy
  has_many :chats
end
