FactoryBot.define do
  factory :item do

    title                 {'abc123題名たいとるタイトル'}
    explanation           {'abc123本文ほんぶんホンブン'}
    category_id           { 2 }
    status_id             { 2 }
    delivery_charge_id    { 2 }
    shipping_area_id      { 2 }
    duration_id           { 2 }
    price                 {500}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end