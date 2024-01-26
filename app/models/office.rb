class Office < ApplicationRecord
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :price, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :bookings,  dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
