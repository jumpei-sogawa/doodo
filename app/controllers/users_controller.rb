class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
