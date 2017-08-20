class AuthToken < ApplicationRecord
  belongs_to :user

  validates :value, presence: true

  before_save :set_expiration_date, on: :create

  def set_expiration_date
    self.expired_at = DateTime.now + 2.weeks
  end
end
