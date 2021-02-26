class Destination < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :post_code
  #   validates :shipping_area_id
  #   validates :city
  #   validates :address
  #   validates :phone_number
  # with_options numericality: { other_than: 1 } do
  #     validates :shipping_area_id
end
