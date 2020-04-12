class User < ApplicationRecord
  has_many :exhb_clips, dependent: :destroy
  has_many :clipped_exhibitions, through: :exhb_clips, source: :exhibition
  has_many :exhb_logs, dependent: :destroy
  has_many :visited_exhibitions, through: :exhb_logs, source: :exhibition
  has_many :exhb_log_likes, dependent: :destroy
  has_many :exhb_log_comments, dependent: :destroy
  has_many :art_logs, dependent: :destroy
  has_many :art_log_likes, dependent: :destroy
  has_many :art_log_comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 },
    format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}
end
