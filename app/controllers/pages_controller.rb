class PagesController < ApplicationController
  def home
    @title = "アート・絵画・美術館・展覧会の口コミ検索サイト | DooDoo"
    @description = "アート・展覧会の口コミサイト「DooDoo」のトップページです。DooDooはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。上野美術館、国立新美術館、国立西洋美術館、六本木など、各地で開催されている展覧会の最新情報をご案内。"
    @exhb_logs = ExhbLog.order(id: "DESC").first(24)
  end

  def trend
    @exhibitions = Exhibition.is_open.order("star DESC NULLS LAST").first(12)
    @arts = Art.order("star DESC NULLS LAST").first(12)
  end

  def search
    @title = "口コミ検索ページ | アート・展覧会の口コミなら【DooDoo】"
    @description = "アート・展覧会の口コミサイト「DooDoo」の口コミ検索ページです。DooDooはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。上野美術館、国立新美術館、国立西洋美術館、六本木など、各地で開催されている展覧会の最新情報をご案内。"

    if params[:museum_area].present? || params[:museum_name].present?
      museums = Museum.where("address LIKE ?", "%#{params[:museum_area]}%").where("name LIKE ?", "%#{params[:museum_name]}%")
      @museums = museums.sort do |a,b|
        if !a.exhibitions.last.star.present?
          1
        elsif !b.exhibitions.last.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @museums = Museum.includes(:exhibitions).order("exhibitions.star DESC NULLS LAST")
    end
    @museums = @museums.select { |museum| museum.id != 1 }.first(20)

    if params[:any].present?
      @exhibitions = Exhibition.search_by_any(params).sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    elsif params[:exhb_area].present? || params[:exhb_name].present? || params[:exhb_date].present?
      @exhibitions = Exhibition.search_by(params).sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @exhibitions = Exhibition.order("star DESC NULLS LAST")
    end
    @exhibitions = @exhibitions.select { |exhb| exhb.id != 1 }.first(20)

    if params[:art_name].present? || params[:artist_name].present?
      arts = Art.search_by(params).first(20)
      @arts = arts.sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @arts = Art.order("star DESC NULLS LAST").first(20)
    end

  end

end