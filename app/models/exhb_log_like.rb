class ExhbLogLike < ApplicationRecord
  belongs_to :user
  belongs_to :exhb_log
  has_many :exhb_log_likes, dependent: :destroy
end
