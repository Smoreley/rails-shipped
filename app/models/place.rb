class Place < ApplicationRecord

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode   #this is going to auto fetch address

end
