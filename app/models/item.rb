class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :duration

  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :duration_id
    validates :image
    validates :user
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end

  validates :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :duration_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end
