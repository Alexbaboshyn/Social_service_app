class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :auth_tokens

  def as_json *args
    {
      id: id,
      email: email,
      full_name: full_name,
      gender: gender,
      birthday: birthday,
      coords: {lat: latitude, lng: longtitude},
      tokens: auth_tokens
    }
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end
end
