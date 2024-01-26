class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, canceled: 2}
end
