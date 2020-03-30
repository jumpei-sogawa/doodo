class Artist < ApplicationRecord
	has_many :arts, dependent: :destroy
end
