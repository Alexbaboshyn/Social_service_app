class PlaceDecorator < ApplicationDecorator
  delegate_all

  private
  def _only
    %I[id name place_id tags city overall_rating]
  end

  def _methods
    methods = %I[coords]
    if context[:place]
      methods << :"ratings"
    end
  end

  def coords
    {
      lat: latitude,

      lng: longitude
    }
  end

  def ratings
    place_users.map do |place_user|
      { user: place_user.user.decorate(context: { brief: true }), rating: place_user.rating }
    end
  end
end
