class User < ActiveRecord::Base
	has_secure_password
	has_many :prev_adventures
	has_many :adventures, through: :prev_adventures
	geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
after_validation :geocode
end