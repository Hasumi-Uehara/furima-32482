class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # 下記データの選択が「--」のときは保存できないようにする。
  validates :category_id, :sales_status_id, :shopping_fee_status_id,
            :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
end
