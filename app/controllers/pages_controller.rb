class PagesController < ApplicationController
  def home
    @title = ""
    @exhibitions = Exhibition.where("star >= ?", 0).order(star: "DESC").first(4)
    @alt_exhibitions = Exhibition.all.first(4 - @exhibitions.count)
    @arts = Art.where("star >= ?", 0).order(star: "DESC").first(4)
    @alt_arts = Art.all.first(4 - @arts.count)
  end

  def trend
    @title = "トレンド"
    @exhibitions = Exhibition.where("star >= ?", 0).order(star: "DESC")
    @arts = Art.where("star >= ?", 0).order(star: "DESC")
  end

  def search
    @title = "検索"
    @exhibitions = Exhibition.all
  end
end