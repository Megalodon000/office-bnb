class Office < ApplicationRecord
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :price, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :bookings,  dependent: :destroy
  has_one_attached :photo
end
