class Room < ApplicationRecord
  belongs_to :match
  belongs_to :team
  has_many :comments
  has_many :room_supporters
  has_many :supporters, through: :room_supporters
end
