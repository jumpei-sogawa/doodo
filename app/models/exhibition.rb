class Exhibition < ApplicationRecord
  belongs_to :museum
  has_many :arts, dependent: :destroy
  has_many :exhb_logs, dependent: :destroy
  has_many :exhb_clips, dependent: :destroy

  def self.search_any(params)
    exhibitions_by_area = []
    Museum.where("address LIKE ?", "%#{params[:any]}%").each do |museum|
      museum.exhibitions.each do |exhb|
        exhibitions_by_area << exhb
      end
    end

    exhibitions = exhibitions_by_area

    if exhibitions.present?
      exhibitions_by_name = Exhibition.where("name LIKE ?", "%#{params[:any]}%")
      if exhibitions_by_name.present?
        exhibitions_by_name.each do |exhibition|
          exhibitions << exhibition
        end
        return exhibitions.uniq
      else
        return exhibitions
      end
    else
      return Exhibition.where("name LIKE ?", "%#{params[:any]}%")
    end

  end

  def self.search(params)
    exhibitions = []

    if params[:area].present?
      Museum.where("address LIKE ?", "%#{params[:area]}%").each do |museum|
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

    exhibitions
  end

  def to_i
    self.star
  end

  def self.update_star_by(exhb_log)
    exhb_log.exhibition.update_star
  end

  def update_star
    star = self.exhb_logs.average(:star)
    self.update(star: star)
  end

  def self.is_open
    self.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
  end
end
