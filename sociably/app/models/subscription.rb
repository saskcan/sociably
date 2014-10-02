class Subscription < ActiveRecord::Base

	belongs_to :user
	belongs_to :task

	before_save :default_values

	validates :user_id, presence: true
	validates :task_id, presence: true
	validates :user_id, uniqueness: { scope: :task_id,
    message: "you can only subscribe to the same task once" }

	def default_values
		self.progress ||= 0.0
	end

end
