class Art < ApplicationRecord
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_logs, dependent: :destroy

  def self.update_stars_by(art_logs)
    art_logs.each do |art_log|
      art_log.art.update_star
    end
  end

  def update_star
    star = self.art_logs.average(:star)
    self.update(star: star)
  end

  def liked_thumb
    if self.art_logs.present?
      sorted_art_logs = self.art_logs.sort { |a,b| a.art_log_likes.count <=> b.art_log_likes.count }
    end

    if sorted_art_logs.present?
      return sorted_art_logs.last.image_url(:thumb)
    else
      return nil
    end
  end

  def liked_image
    if self.art_logs.present?
      sorted_art_logs = self.art_logs.sort { |a,b| a.art_log_likes.count <=> b.art_log_likes.count }
    end

    if sorted_art_logs.present?
      return sorted_art_logs.last.image
    else
      return nil
    end
  end
end
