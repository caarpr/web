class Volunteer < ApplicationRecord
  include Transformable

  geocoded_by :address
  after_validation :geocode

  clean(:phone_number) do |num| 
    cleaned = num.gsub(/\D/, '')

    # strip leading country code
    if cleaned.length == 11 && cleaned.start_with?('1')
      cleaned = cleaned[1..-1]
    end

    cleaned
  end

  validates_length_of :phone_number, is: 10, message: "should be 10 digits", allow_blank: true

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
