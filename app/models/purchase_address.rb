class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :city, :shipping_area_id, :address, :building_name, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "を正しく入力して下さい"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "を正しく入力して下さい"}
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :phone_number, numericality: { only_integer: true, message: "を正しく入力して下さい"}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end