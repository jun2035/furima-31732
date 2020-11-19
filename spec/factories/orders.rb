FactoryBot.define do
  factory :order do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 13 }
    city          { '港区' }
    address       { '青山1-1-1' }
    building_name { 'ビル名10F' }
    phone_number  { '09011112222' }
    association :user
    association :item
  end
end
