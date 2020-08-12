FactoryBot.define do
  factory :stadium do
    stadium_name  {Faker::Name.name}
    city          {Faker::Address.city}
  end
end