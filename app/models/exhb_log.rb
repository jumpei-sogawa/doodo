class ExhbLog < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  has_many :art_logs, dependent: :destroy
  accepts_nested_attributes_for :art_logs, allow_destroy: true
end
