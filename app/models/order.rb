class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :destination
  
  # validates :price,  presence: true
end
