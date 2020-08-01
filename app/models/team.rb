class Team < ApplicationRecord
  has_many :supporters
  has_many :rooms
  has_many :players
  has_many :home_team_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_team_matches, class_name: 'Match', foreign_key: 'away_team_id'
end
