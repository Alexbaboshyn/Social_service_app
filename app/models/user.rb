class User < ApplicationRecord
  has_secure_password

  enum gender: [:male, :female]

  has_many :auth_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end
