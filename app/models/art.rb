class Art < ApplicationRecord
  belongs_to :exhibition
  belongs_to :artist
  has_many :art_logs
end
