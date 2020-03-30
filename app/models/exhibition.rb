class Exhibition < ApplicationRecord
  belongs_to :museum
  has_many :arts
end
