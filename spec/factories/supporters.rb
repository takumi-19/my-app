FactoryBot.define do

  factory :supporter do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    team
    avatar_image          {File.open("#{Rails.root}/public/images/test_image.jpg")}
    biography             {Faker::Lorem.sentence}
    password = Faker::Internet.password(min_length: 8)
    password              {password}
    password_confirmation {password}
  end

end