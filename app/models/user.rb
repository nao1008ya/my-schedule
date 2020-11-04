class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    #  パスワードに半角英数字を両方含める(on: :createにより編集時はpasswordの入力省く)
    validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i }, on: :create
  end
      
  # アソシエーションを設定
  has_many :events
  # has_many :groups, through: :group_users
end
