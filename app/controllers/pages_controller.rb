class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def trend
    @exhibitions = Exhibition.all
    @arts = Art.all
  end

  def search
    @search_params = search_params
    if search_params[:area]
      museums = Museum.where("address LIKE ?", "%#{search_params[:area]}%")
      @exhibitions = []
      museums.each do |museum|
        museum.exhibitions.each do |exhb|
          @exhibitions << exhb
        end
      end
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
