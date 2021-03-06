class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :reviews, dependent: :destroy
  has_many :active_relationships,  class_name: "Relationship",
                                  foreign_key: "follower_id",
                                    dependent: :destroy
                                    
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy

  has_many :following, through: :active_relationships,
                        source: :followed

  has_many :followers, through: :passive_relationships,
                        source: :follower

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
  self.remember_token = User.new_token
  update_attribute(:remember_digest, User.digest(remember_token))
  end

   # 渡されたトークンがダイジェストと一致したらtrueを返す
   def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
   end
  # def feed
  #   Post.where("user_id:?", self.id)
  # end

    # ユーザーのログイン情報を破棄する
    def forget
      update_attribute(:remember_digest, nil)
    end

    def following?(other_user)
      following.include?(other_user)
    end
  
end