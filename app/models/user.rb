class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


  with_options presence: true do
    validates :name
    #  パスワードに半角英数字を両方含める(on: :createにより編集時はpasswordの入力省く)
    validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i }, on: :create
  end
      
  # アソシエーションを設定
  has_many :events
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :sns_credentials

  # SNS認証用インスタンス
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
