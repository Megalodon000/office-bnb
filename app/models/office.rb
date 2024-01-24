class Office < ApplicationRecord
<<<<<<< HEAD
    validates :title, presence: true
    belongs_to :user
=======
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :price, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
>>>>>>> 9f1710c2b32b30e4836d6fc414b66047bd49746e
end
