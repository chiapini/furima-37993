FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name}
    information { Faker::Lorem.characters(number: 100)}
    category_id  { Category.all.sample }
    situation_id  { Situation.all.sample }
    delivery_id  { Delivery.all.sample }
    area_id  { Area.all.sample }
    jour_id  { Jour.all.sample }
    price { Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
