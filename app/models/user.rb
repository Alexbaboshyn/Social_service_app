class User < ApplicationRecord
  has_secure_password

  enum gender: [:male, :female]

  has_many :auth_tokens, dependent: :destroy

  has_attached_file :avatar, styles: { thumb: "300x300>" }
  
  validates_attachment :avatar,
                        content_type: { content_type: "image/jpeg" }


  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  after_create :generate_auth_token

  def generate_auth_token
    self.auth_tokens.create
  end
end
