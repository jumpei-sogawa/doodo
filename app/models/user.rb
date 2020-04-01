class User < ApplicationRecord
  has_many :exhb_logs, dependent: :destroy
  has_many :art_logs, dependent: :destroy
  has_many :exhb_clips, dependent: :destroy
  has_many :exhb_log_likes, dependent: :destroy
  has_many :srt_log_likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
