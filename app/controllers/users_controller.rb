class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
    @clipped_exhibitions = @user.clipped_exhibitions.uniq
    @visited_exhibitions = @user.visited_exhibitions.uniq
  end

  def edit
    @user = current_user
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
