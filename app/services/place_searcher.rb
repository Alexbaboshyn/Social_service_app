class PlaceSearcher

  attr_accessor :city, :tags

  def initialize params
    params = params.symbolize_keys || {}

    @city = params[:city]

    @tags = params[:tags]
  end

  def search
    places = Place.all

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
