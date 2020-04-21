class PagesController < ApplicationController
  def home
    @title = "アート・絵画・美術館・展覧会の口コミ検索サイト | stART"
    @description = "アート・展覧会の口コミサイト「stART」のトップページです。stARTはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。上野美術館、国立新美術館、国立西洋美術館、六本木など、各地で開催されている展覧会の最新情報をご案内。"
    @headline = ""
    @exhibitions = Exhibition.is_open.order("star DESC NULLS LAST").first(4)
    @arts = Art.order("star DESC NULLS LAST").first(4)
  end

  def trend
    # @headline = "トレンド"
    # @exhibitions = Exhibition.is_open.order(star: "DESC").first(4)
    # @arts = Art.order(star: "DESC").first(4)
  end

  def search
    @title = "口コミ検索ページ | アート・展覧会の口コミなら【stART】"
    @description = "アート・展覧会の口コミサイト「stART」の口コミ検索ページです。stARTはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。上野美術館、国立新美術館、国立西洋美術館、六本木など、各地で開催されている展覧会の最新情報をご案内。"
    @headline = "検索"
    @exhibitions = Exhibition.is_open.order("star DESC NULLS LAST")
  end
end