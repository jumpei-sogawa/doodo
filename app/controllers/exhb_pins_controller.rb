class ExhbPinsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exhibition

  def create
    ExhbPin.create(user_id: current_user.id, exhibition_id: params[:exhibition_id])
  end

  def destroy
    ExhbPin.find(params[:id]).destroy
  end

  private

    def set_exhibition
      @exhb = Exhibition.find(params[:exhibition_id])
    end
end
