class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  has_one_active_hash :sales_status_id
  has_one_active_hash :shopping_fee_status_id
  has_one_active_hash :prefecture_id
  has_one_active_hash :scheduled_delivery_id

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
  end

  validates :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
end
