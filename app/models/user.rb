class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  validates :password, length: { in: 8..30 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { in: 1..20 }
  validates :description, length: { maximum: 200 }

  def own?(object)
    id == object.user_id
  end

  def liked?(post)
    post.likes.pluck(:user_id).include?(id)
  end

  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.delete(post)
  end

  def bookmarked?(post)
    post.bookmarks.pluck(:user_id).include?(id)
  end

  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.delete(post)
  end
end
