FactoryBot.define do
  factory :order_destination do
    token {'tokenusertoken'} 
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '渋谷区神宮前' }
    address { '1-2-3' }
    building_name { '渋谷ビル' }
    phone_number { '08012345678' }
  end
end

