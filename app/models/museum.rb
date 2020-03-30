class Museum < ApplicationRecord
  belongs_to :prefecture
  has_many :exhibitions, dependent: :destroy
end
