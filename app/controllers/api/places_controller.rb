class Api::PlacesController < ApplicationController
  private
  def resource
    Place.find( params[:id] )
  end

  def collection
    Place.all
  end
end
