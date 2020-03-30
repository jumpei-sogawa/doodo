class User < ApplicationRecord
  has_many :exhb_logs, dependent: :destroy
  has_many :art_logs, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
