class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to "/#{current_user.username}"
  end

  def show
    if user_signed_in? && @user.id == current_user.id
      @title = "マイページ"
    else
      @title = "ユーザーページ"
    end
    @clipped_exhibitions = @user.clipped_exhibitions.distinct
    @visited_exhibitions = @user.visited_exhibitions.distinct
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
  end

  def edit
    if @user != current_user
      redirect_to "/#{@user.username}"
    end
    @title = "プロフィール編集"
  end

  def update
    if @user.update(user_params)
      redirect_to "/#{@user.username}"
    else
      redirect_to "/#{@user.username}/edit"
    end
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end

    def user_params
      params.fetch(:user, {}).permit(:username, :name, :bio, :image)
    end
end
