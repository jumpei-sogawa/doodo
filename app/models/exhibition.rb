class Exhibition < ApplicationRecord
  belongs_to :museum
  has_many :arts, dependent: :destroy
  has_many :exhb_logs, dependent: :destroy
  has_many :exhb_clips, dependent: :destroy

  def self.search_any(params)
    exhibitions_by_area = []

    museums = Museum.where("address LIKE ?", "%#{params[:any]}%")
    museums.each do |museum|
      museum.exhibitions.each do |exhb|
        exhibitions_by_area << exhb
      end
    end

    exhibitions = []

    if exhibitions_by_area.present?
      exhibitions_by_name = Exhibition.where("name LIKE ?", "%#{params[:any]}%")
      if exhibitions_by_name.present?
        exhibitions_by_name.each do |exhibition|
          exhibitions_by_area.select { |exhb| exhibition.id != exhb.id }.each do |e|
            exhibitions << e
          end
        end
        return exhibitions
      end
      return exhibitions_by_area
    end

    exhibitions = Exhibition.where("name LIKE ?", "%#{params[:any]}%")
    return exhibitions
  end

  def self.search(params)
    exhibitions = []

    if params[:area].present?
      museums = Museum.where("address LIKE ?", "%#{params[:area]}%")
      museums.each do |museum|
        museum.exhibitions.each do |exhb|
          exhibitions << exhb
        end
      end
    else
      exhibitions = Exhibition.all
    end

    exhbs = []
    if params[:name].present?
      Exhibition.where("name LIKE ?", "%#{params[:name]}%").each do |exhb|
        exhbs << exhibitions.select { |e| e.id == exhb.id }[0]
      end
      exhbitions = exhbs
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

  def self.is_open
    exhibitions = self.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
    return exhibitions
  end
end
