class User < ApplicationRecord
  has_many :exhb_pins, dependent: :destroy
  has_many :clipped_exhibitions, through: :exhb_pins, source: :exhibition
  has_many :exhb_logs, dependent: :destroy
  has_many :visited_exhibitions, through: :exhb_logs, source: :exhibition
  has_many :exhb_log_likes, dependent: :destroy
  has_many :exhb_log_comments, dependent: :destroy
  has_many :art_logs, dependent: :destroy
  has_many :art_log_likes, dependent: :destroy
  has_many :art_log_comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validate :username_validate

  validates :username,
    # presence: true,
    # length: { minimum: 4, maximum: 20 },
    uniqueness: { case_sensitive: :false },
    format: { with: /\A[a-z0-9]+\z/, message: "は半角英小文字/数字で入力してください"}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  validates :name, length: { maximum: 20, message: "20字以内で入力してください" }

  validates :bio, length: { maximum: 150, message: "150字以内で入力してください"}

  attr_writer :login

  def username_validate
    if username.blank? || username.length < 4 || username.length >20
      errors.add(:username, "を4~20字で入力してください")
    end
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
