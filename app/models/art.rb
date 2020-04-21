class Art < ApplicationRecord
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_logs, dependent: :destroy

  def self.search_by(params)
    arts = []

    if params[:artist_name].present?
      Artist.where("name LIKE ?", "%#{params[:artist_name]}%").each do |artist|
        artist.arts.each do |art|
          arts << art
        end
      end
    else
      arts = Art.all
    end

    temp_arts = []
    if params[:art_name].present?
      Art.where("name LIKE ?", "%#{params[:art_name]}%").each do |art|
        temp_arts << arts.select { |a| a.id == art.id }[0]
      end
      arts = temp_arts
    end

    arts
  end

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
