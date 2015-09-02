class Adventure < ActiveRecord::Base
	has_many :prev_adventures
	has_many :users, through: :prev_adventures
end