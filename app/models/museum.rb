class Museum < ApplicationRecord
  belongs_to :prefecture
  has_many :exhibitions, dependent: :destroy

  def to_i
    self.exhibitions.last.star
  end
end
