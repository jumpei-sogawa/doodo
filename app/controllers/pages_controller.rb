class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def trend
    @exhibitions = Exhibition.where("star >= ?", 0).order(star: "DESC")
    @arts = Art.where("star >= ?", 0).order(star: "DESC")
  end

  def search
    @exhibitions = Exhibition.all
  end

  def mypage
    redirect_to "/#{current_user.username}"
  end
end