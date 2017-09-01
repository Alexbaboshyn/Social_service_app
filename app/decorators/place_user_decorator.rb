class PlaceUserDecorator < ApplicationDecorator
  delegate_all

  decorates_association :users, context: {brief: true}

  # decorates_association :place

  private
  def _only
    %I[rating]
  end

  def _methods
    %I[place]
  end

  def place
    model.place.decorate
  end
end
