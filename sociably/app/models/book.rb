class Book < ActiveRecord::Base
	has_many :chapters
	belongs_to :publisher
	has_many :contributions, as: :contributable
	has_many :subscriptions, as: :subscribable

	def publisher_name
		if publisher
			publisher.name
		end
	end

	def display_name
		title
	end
end
