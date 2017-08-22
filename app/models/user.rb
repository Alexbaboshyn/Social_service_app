class User < ApplicationRecord
  has_secure_password

  enum gender: [:male, :female]

  has_many :auth_tokens, dependent: :destroy

  # has_attached_file :avatar, styles: { thumb: "300x300>" }
  #
  # validates_attachment :avatar, presence: true,
  #                       content_type: { content_type: "image/jpeg" },
  #                       size: { in: 0..10.kilobytes }

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end
