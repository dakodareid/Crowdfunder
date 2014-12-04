class Project < ActiveRecord::Base
	has_many :rewards
	has_many :pledges 
	accepts_nested_attributes_for :rewards
end
