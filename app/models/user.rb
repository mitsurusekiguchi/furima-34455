class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

  VALID_name_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/

  VALID_reading_REGEX = /\A[ァ-ヶ]+\z/

  validates :nickname
  validates :last_name, format: { with: VALID_name_REGEX }
  validates :first_name,format: { with: VALID_name_REGEX }
  validates :last_name_reading, format: { with: VALID_reading_REGEX }
  validates :first_name_reading, format: { with: VALID_reading_REGEX }
  validates :birthday
 end
  validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }
end
