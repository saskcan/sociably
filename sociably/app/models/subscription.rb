class Subscription < ActiveRecord::Base

	belongs_to :user
	#belongs_to :task
	belongs_to :subscribable, polymorphic: true

	before_save :default_values

	validates :user_id, presence: true
	#validates :task_id, presence: true
	#need to add validation for new polymorphic models
	#validates :user_id, uniqueness: { scope: :task_id,
  #  message: "you can only subscribe to the same task once" }

	def default_values
		self.progress ||= 0.0
	end

	def subscribable_display_name
		subscribable.display_name
	end

end