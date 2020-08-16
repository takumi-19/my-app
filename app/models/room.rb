class Room < ApplicationRecord
  belongs_to :match
  belongs_to :team
  has_many :comments
end
