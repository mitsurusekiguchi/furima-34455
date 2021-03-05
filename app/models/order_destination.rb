class OrderDestination
  include ActiveModel::Model 
  attr_accessor :post_code, :shipping_area_id, :city,:address, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    # validates :token カード情報を登録出来るようにしたことで不要になる。
    validates :post_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  with_options numericality: { other_than: 1 } do
      validates :shipping_area_id
  with_options  format: {with: /\A\d{10,11}\z/} do
      validates :phone_number
  end
 end
end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Destination.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end