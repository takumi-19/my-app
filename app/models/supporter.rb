class Supporter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar_image, ImageUploader

  belongs_to :team
  has_many :comments
  has_many :room_supporters
  has_many :rooms, through: :room_supporters
end
