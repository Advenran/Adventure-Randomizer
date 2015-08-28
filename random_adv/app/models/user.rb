class User < ActiveRecord::Base
	has_many :events
	has_many :prev_adventures, through: :events
end