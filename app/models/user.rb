class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_name_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/

  VALID_reading_REGEX = /\A[ァ-ヶ]+\z/

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_name_REGEX }
  validates :first_name, presence: true, format: { with: VALID_name_REGEX }
  validates :last_name_reading, presence: true, format: { with: VALID_reading_REGEX }
  validates :first_name_reading, presence: true, format: { with: VALID_reading_REGEX }
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
