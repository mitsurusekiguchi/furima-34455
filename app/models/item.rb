class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one :order
  has_many_attached :images

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates_inclusion_of :price, in: 300..9_999_999, format: { with: /([0-9].*[0-9])/ }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
