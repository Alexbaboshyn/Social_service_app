class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  helper_method :collection, :resource

  before_action :authenticate

  attr_reader :current_user

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  def create
    build_resource

    resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!

    head 204
  end

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.joins(:auth_token).find_by(auth_tokens: { value: token })
    end
  end
end
