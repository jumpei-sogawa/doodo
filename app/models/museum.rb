class Museum < ApplicationRecord
  belongs_to :prefecture
  has_many :exhibitions
end
