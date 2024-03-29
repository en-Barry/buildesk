class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  before_destroy :destroy_image_s3
  before_create :set_uuid

  mount_uploader :image, UserImageUploader

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  validates :name, presence: true, length: { maximum: 50 } # Twitterに準拠
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, on: :create
  validates :email, uniqueness: { case_sensitive: true }, unless: -> { email.blank? }
  validates :password, length: { in: 8..30 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :description, length: { maximum: 200 }
  validates :uuid, presence: true, uniqueness: { case_sensitive: true }, length: { in: 4..15 }, format: { with: /\A[a-zA-Z\d_\-]+\z/ } # Twitterに準拠

  enum role: { general: 0, admin: 1 }

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

  def to_param
    uuid
  end

  private

  def destroy_image_s3
    image.remove!
    image.thumb.remove!
  rescue Excon::Errors::Error => e
    puts 'Something gone wrong'
    false
  end

  def set_uuid
    self.uuid ||= SecureRandom.alphanumeric(10)
  end
end
