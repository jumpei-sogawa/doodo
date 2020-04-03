class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to "/#{current_user.username}"
  end

  def show
    @clipped_exhibitions = @user.clipped_exhibitions.distinct
    @visited_exhibitions = @user.visited_exhibitions.distinct
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
  end

  def edit
    unless @user == current_user
      redirect_to "/#{@user.username}"
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to "/#{current_user.username}"
    else
      redirect_to "/#{@user.username}/edit"
    end
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end

    def user_params
      params.fetch(:user, {}).permit(:username, :display_name, :bio, :image)
    end
end
