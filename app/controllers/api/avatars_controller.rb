class Api::AvatarsController < ApplicationController
  before_action :set_avatar, only: [:create, :update]

  def create
  end

  def update
  end

  def destroy
    current_user.avatar = nil
    current_user.save
    head 204
  end

  private
  def set_avatar
    current_user.update! resource_params
    head :ok
  end

  def resource_params
    params.require(:user).permit(:avatar)
  end
end
