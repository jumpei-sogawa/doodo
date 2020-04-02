class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user

  def show
    @clipped_exhibitions = @user.clipped_exhibitions.distinct
    @visited_exhibitions = @user.visited_exhibitions.distinct
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to mypage_path
    else
      redirect_to edit_user_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {}).permit(:username, :display_name, :bio, :image)
    end
end
