class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def trend
    @exhibitions = Exhibition.all
    @arts = Art.all
  end

  def search
    @search_params = search_params
    if search_params[:area] && search_params[:date]
      @exhibitions = Exhibition.search(search_params)
    else
      @exhibitions = Exhibition.all
    end
  end

  def mypage
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:area, :date)
  end
end
