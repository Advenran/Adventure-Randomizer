class Prev_Adventure < ActiveRecord::Base
	belongs_to :user
	belongs_to :adventure
end