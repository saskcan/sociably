class Website < ActiveRecord::Base
	has_many :contributions, as: :contributable
	has_many :subscriptions, as: :subscribable

	def display_name
		name
	end
end
