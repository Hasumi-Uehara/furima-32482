class UserOrder
  include ActiveModel::Model
  attr_accessor :city, :addresses, :postal_code, :phone_number, :prefecture_id, :building

  with_options presence: true do
    validates :city
    validates :addresses
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

end