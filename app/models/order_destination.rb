class OrderDestination
  include ActiveModel::Model 
  attr_accessor :post_code, :shipping_area_id, :city,:address, :building_name, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :city
  validates :address
  validates :phone_number
end
with_options numericality: { other_than: 1 } do
  validates :shipping_area_id
  # validates :token, presence: true
end
with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
validates :post_code
end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Destination.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, order_id: order.id)
  end
end