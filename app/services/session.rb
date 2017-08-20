class Session
  include ActiveModel::Validations

  attr_reader :email, :password

  def initialize params
    params = params.try(:symbolize_keys) || {}

    @user = params[:user]

    @email = params[:email]

    @password = params[:password]
  end

  validate do |model|
    if user
      model.errors.add :password, 'is invalid' unless user.authenticate password
    else
      model.errors.add :email, 'not found'
    end
  end

  def save!
    raise ActiveModel::StrictValidationFailed unless valid?

    user.auth_tokens.create value: SecureRandom.uuid
  end

  def destroy!
    user.auth_token.destroy!
  end

  def auth_token
    user.try(:auth_token).try(:value)
  end

  private
  def user
    @user ||= User.find_by email: email
  end
end
