module ApplicationHelper
  def default_meta_tags
    {
      title: @title,
      description: @description,
      og: defalut_og,
      twitter: default_twitter_card
    }
  end

  def is_admin?
    if user_signed_in?
      return current_user.email == "admin@doodoo.jp"
    end
    return false
  end

  private

  def defalut_og
    {
      title: :full_title,          # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
      description: :description,   # 上に同じ
      url: request.url,
      # image: 'https://example.com/hoge.png'
    }
  end

  def default_twitter_card
    {
      card: 'summary_large_image', # または summary
      # site: '@hogehoge'            # twitter ID
    }
  end
end
