class ExhbLog < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  has_many :art_logs
end
