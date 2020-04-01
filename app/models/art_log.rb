class ArtLog < ApplicationRecord
  belongs_to :user
  belongs_to :exhb_log
  belongs_to :art
  has_many :art_log_likes, dependent: :destroy
  has_many :art_log_comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  def num_likes
    self.art_log_likes.count
  end
end
