class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, presence: true

  validates :category_id, :status_id,:shipping_cost_id, :shipping_area_id, :shipping_day_id, numericality: { other_that: 1 }
end
