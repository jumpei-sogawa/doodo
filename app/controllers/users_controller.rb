class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to "/#{current_user.username}"
  end

  def show
    if user_signed_in? && @user.id == current_user.id
      @title = "マイページ | アート・展覧会の口コミなら【stART】"
      @description = "アート・展覧会の口コミサイト「stART」のマイページです。マイページにログインすることで、アート・絵画・美術館・展覧会・美術展の口コミを投稿することができます。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報もご案内。"
      @headline = "マイページ"
    else
      @title = "#{@user.username}のページ | アート・展覧会の口コミなら【stART】"
      @description = "アート・展覧会の口コミサイト「stART」のユーザーページです。stARTはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報をご案内。"
      @headline = "ユーザーページ"
    end
    @clipped_exhibitions = @user.clipped_exhibitions.distinct
    @visited_exhibitions = @user.visited_exhibitions.distinct
    @exhb_logs = @user.exhb_logs.order(id: "DESC")
  end

  def edit
    if @user != current_user
      redirect_to "/#{@user.username}"
    end
    @headline = "プロフィール編集"
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
