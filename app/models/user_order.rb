class UserOrder
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number
  
end