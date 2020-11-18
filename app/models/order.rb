class Order
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id,)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end  
end