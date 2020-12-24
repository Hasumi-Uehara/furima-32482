class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :city
    validates :addresses
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    item_id = Item.find(params[:item_id])
    order = Order.create(user_id: current_user.id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end