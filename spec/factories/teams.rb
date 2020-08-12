FactoryBot.define do

  factory :team do
    team_name             {Faker::Team.name}
    team_logo             {File.open("#{Rails.root}/public/images/test_image.jpg")}
    team_color            {Faker::Color.color_name}
  end

end