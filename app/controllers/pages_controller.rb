class PagesController < ApplicationController
  def trend
    @exhibitions = Exhibition.where("star >= ?", 0).order(star: "DESC")
    @arts = Art.where("star >= ?", 0).order(star: "DESC")
  end

  def search
    @exhibitions = Exhibition.all
  end
end