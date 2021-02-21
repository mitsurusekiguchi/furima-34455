class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname 
    validates :birthday

  with_options format:{with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
    validates :last_name
    validates :first_name
    
  with_options format:{with: /\A[ァ-ヶ]+\z/} do
    validates :last_name_reading
    validates :first_name_reading
  end
 end
end
    validates :password, format:{ with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }
end