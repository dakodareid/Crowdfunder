class Project < ActiveRecord::Base
	belongs_to :owners, class_name: "User"

	has_many :pledges
  	has_many :backers, through: :pledges, source: :user

	has_many :rewards
	
	accepts_nested_attributes_for :rewards
end
