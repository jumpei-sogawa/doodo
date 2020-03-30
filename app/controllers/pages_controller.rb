class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def trend
    @exhibitions = Exhibition.all
    @arts = Art.all
  end

  def search
    @exhibitions = Exhibition.all
  end

  def mypage
  end
end
