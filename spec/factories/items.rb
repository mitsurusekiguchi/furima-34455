FactoryBot.define do
  factory :item do
    association :user

    name              { '商品名' }
    description       { '商品説明' }
    category_id       { 2 }
    status_id         { 2 }
    shipping_cost_id  { 2 }
    shipping_area_id  { 2 }
    shipping_day_id   { 2 }
    price             { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
