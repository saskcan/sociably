class Role < ActiveRecord::Base
	has_many :contributions
end
