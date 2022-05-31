FactoryBot.define do
  address = Gimei.address
  factory :purchase_address do
   token    {"tok_abcdefghijk00000000000000000"}
   post_code  {1234567.to_s.insert(3, "-")}
   area_id   { Faker::Number.between(from: 2, to: 48) }
   municipality    {address.city.kanji}
   address  {address.town.kanji}
   building  {"ハイコート"}
   phone      { Faker::Number.number(digits: 11) }
  end
end
