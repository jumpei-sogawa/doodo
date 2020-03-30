class PagesController < ApplicationController
  def trend
    @exhibitions = Exhibition.all
    @arts = Art.all
  end

  def search
  end

  def mypage
  end
end
