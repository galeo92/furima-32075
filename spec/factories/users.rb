FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'名前'}
    first_name            {'名前'}
    last_name_frigana     {'カタカナ'}
    first_name_frigana    {'カタカナ'}
    birthday              {'1931-02-09'}
  end
end