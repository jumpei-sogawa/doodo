class ArtLog < ApplicationRecord
  belongs_to :user
  belongs_to :exhb_log
  belongs_to :art

  mount_uploader :image, ImageUploader
end
