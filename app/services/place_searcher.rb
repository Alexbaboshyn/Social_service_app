class PlaceSearcher

  attr_accessor :city, :tags, :current_user

  def initialize params
    params = params.symbolize_keys || {}

    @city = params[:city]

    @tags = params[:tags]

    @current_user = params[:current_user]
  end

  def search
    places = Place.within_radius(6000, @current_user.lat, @current_user.lng).all

    if @city.present?
      places = places.where(city: @city.capitalize)
    end

    places

    if @tags.present?
      places = places.where("'#{ @tags }' = ANY (tags)")
    end
    places

  end
end
