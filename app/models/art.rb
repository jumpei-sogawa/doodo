class Art < ApplicationRecord
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_logs, dependent: :destroy

  mount_uploader :image, ImageUploader

  def self.update_stars_by(art_logs)
    art_logs.each do |art_log|
      art_log.art.update_star
    end
  end

  def update_star
    star = self.art_logs.average(:star)
    self.update(star: star)
  end
end
