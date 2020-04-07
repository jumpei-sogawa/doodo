class Exhibition < ApplicationRecord
  belongs_to :museum
  has_many :arts, dependent: :destroy
  has_many :exhb_logs, dependent: :destroy
  has_many :exhb_clips, dependent: :destroy

  def self.search(params)
    exhbs = []
    exhibitions = []

    if params[:area].present?
      museums = Museum.where("address LIKE ?", "%#{params[:area]}%")
      museums.each do |museum|
        museum.exhibitions.each do |exhb|
          exhbs << exhb
        end
      end
    else
      exhbs = Exhibition.all
    end

    if params[:name].present?
      Exhibition.where("name LIKE ?", "%#{params[:name]}%").each do |exhb|
        if exhbs.select { |e| e.id == exhb.id }
          exhibitions << exhb
        end
      end
    end

    if params[:date].present?
      date = Date.strptime(params[:date])
      exhibitions = exhibitions.select { |exhb| (exhb.start_date <= date && exhb.end_date >= date) }
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
