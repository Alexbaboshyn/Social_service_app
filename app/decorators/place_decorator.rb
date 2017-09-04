class PlaceDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user

  private
  def _only
    %I[id name place_id tags city overall_rating]
  end

  def _methods
    methods = %I[coords distance]
    if context[:place]
      methods << :"ratings"
    end
    methods
  end

  def coords
    {
      lat: lat,

      lng: lng
    }
  end

  def distance
    h.current_user.distance_to_place(lat, lng)
  end

  def ratings
    place_users.map do |place_user|
      { user: place_user.user.decorate(context: { brief: true }), rating: place_user.rating }
    end
  end
end
