FactoryBot.define do
  factory :match do
    week            {Faker::Number.between(from: 1, to: 34)}
    kick_off        {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    association :home_team, factory: :team
    association :away_team, factory: :team
    stadium
    home_team_score {Faker::Number.between(from: 0, to: 20)}
    away_team_score {Faker::Number.between(from: 0, to: 20)}
  end
end