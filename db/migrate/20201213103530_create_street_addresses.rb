class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|

      t.string :postal_code,    default: "",  null: false
      t.integer :shipping_area_id,            null: false
      t.string :city,           default: ""
      t.string :address,        default: ""
      t.string :building_name,  default: ""
      t.references :purchase_record, foreign_key: true
      t.string :phone_number,                null: false

      t.timestamps
    end
  end
end
