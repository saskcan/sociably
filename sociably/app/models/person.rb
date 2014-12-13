class Person < ActiveRecord::Base
	has_many :contributions
	has_many :roles, through: :contributions
end
