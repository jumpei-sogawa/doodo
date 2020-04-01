class Exhibition < ApplicationRecord
  belongs_to :museum
  has_many :arts, dependent: :destroy
  has_many :exhb_logs, dependent: :destroy
  has_many :exhb_clips, dependent: :destroy

  def self.search(search_params)
    if search_params[:area].present?
      museums = Museum.where("address LIKE ?", "%#{search_params[:area]}%")
      exhibitions = []
      museums.each do |museum|
        museum.exhibitions.each do |exhb|
          exhibitions << exhb
        end
      end
    else
      exhibitions = Exhibition.all
    end

    if search_params[:date].present?
      date = Date.strptime(search_params[:date])
      exhibitions = exhibitions.select { |exhb| (exhb.start_date <= date && exhb.end_date >= date)}
    end

    return exhibitions
  end

  def to_i
    return self.star
  end

  def self.update_star_by(exhb_log)
    exhb_log.exhibition.update_star
  end

  def update_star
    star = self.exhb_logs.average(:star)
    self.update(star: star)
  end
end
