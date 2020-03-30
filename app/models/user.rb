class User < ApplicationRecord
  has_many :exhb_logs
  has_many :art_logs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
