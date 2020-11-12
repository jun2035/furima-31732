FactoryBot.define do
  factory :user do
    nickname              { 'ニックネーム' }
    email                 { 'test@test.com' }
    password              { 'q1q1q1' }
    password_confirmation { password }
    last_name             { '苗字' }
    first_name            { '名前' }
    last_name_kana        { 'ミョウジカナ' }
    first_name_kana       { 'ナマエカナ' }
    birthday              { '2020-01-01' }

    # nickname              { Faker::Name.initials }
    # email                 { Faker::Internet.unique.free_email }
    # password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    # password_confirmation { password }
    # last_name             { Faker::Name.last_name }
    # first_name            { Faker::Name.first_name }
    # last_name_kana        { 'ミョウジカナ' }
    # first_name_kana       { 'ナマエカナ' }
    # birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
