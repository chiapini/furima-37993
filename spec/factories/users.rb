FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name }
    email  { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length:6, mix_case: true) }
    password_confirmation { password }
    last  { person.first.kanji }
    first { person.last.kanji }
    last2 { person.first.katakana }
    first2 { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end
