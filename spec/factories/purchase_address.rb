FactoryBot.define do
  factory :purchase_address do

    postal_code                 {'111-1111'}
    shipping_area_id            { 2 }
    city                        {'市区町村'}
    address                     {'番地'}
    building_name               { nil }
    phone_number                {'09011111111'}
    token                       {"tok_abcdefghijk00000000000000000"}

  end
end
