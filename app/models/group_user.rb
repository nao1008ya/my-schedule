class GroupUser < ApplicationRecord
  # アソシエーションを設定
  belongs_to :user
  belongs_to :group
end
