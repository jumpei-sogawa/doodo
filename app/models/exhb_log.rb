class ExhbLog < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  has_many :exhb_log_likes, dependent: :destroy
  has_many :exhb_log_comments, dependent: :destroy
  has_many :art_logs, dependent: :destroy
  accepts_nested_attributes_for :art_logs, allow_destroy: true

  validates :body, length: { maximum: 1000 }
end
