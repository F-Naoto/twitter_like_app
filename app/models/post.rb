class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  default_scope -> {self.order(created_at: :desc)}
  validates :user_id, presence:true
  validates :content, presence:true, length:{maximum:50}

  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end
end
