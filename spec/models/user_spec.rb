require 'rails_helper'

RSpec.describe User, type: :model do
  it { should be_an ApplicationRecord }

  it { should have_secure_password }

  it { should define_enum_for :gender }

  # it { should have_many(:auth_tokens).dependent(:destroy) }

  it { should validate_presence_of :email }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should_not allow_value('test').for(:email) }

  it { should allow_value('test@test.com').for(:email) }
end
