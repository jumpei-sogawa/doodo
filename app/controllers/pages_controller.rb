class PagesController < ApplicationController
  def home
    @title = ""
    @exhibitions = Exhibition.is_held.order(star: "DESC").first(4)
    @arts = Art.order(star: "DESC").first(4)
  end

  def trend
    # @title = "トレンド"
    # @exhibitions = Exhibition.is_held.order(star: "DESC").first(4)
    # @arts = Art.order(star: "DESC").first(4)
  end

  def search
    @title = "検索"
    @exhibitions = Exhibition.is_held
  end
end