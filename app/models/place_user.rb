class PlaceUser < ApplicationRecord
  belongs_to :user

  belongs_to :place

  validates :rating, uniqueness: { scope: [:user_id, :place_id],
                                   message: "rating should be uniq for each place from each user"},
                                   numericality: (1..5)
end
