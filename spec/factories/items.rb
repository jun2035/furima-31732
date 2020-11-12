FactoryBot.define do
  factory :item do
    title         { Faker::Lorem.sentence }
    text          { Faker::Lorem.sentence }
    category_id   { '1' }
    status_id     { '1' }
    shipping_id   { '1' }
    prefecture_id { '1' }
    day_id        { '1' }
    price         { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
