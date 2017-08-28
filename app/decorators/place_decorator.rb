class PlaceDecorator < ApplicationDecorator
  delegate_all

  private
  def _only
    %I[name place_id tags city overall_rating]
  end

  def _methods
    %I[coords]
  end

  def coords
    {
      lat: latitude,

      lng: longitude
    }
  end
end
