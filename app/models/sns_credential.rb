class SnsCredential < ApplicationRecord
  # アソシエーションを設定
  belongs_to :user, optional: true
end
