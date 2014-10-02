class Task < ActiveRecord::Base

	has_many :subscriptions, dependent: :destroy
	has_many :users, through: :subscriptions
	has_many :tags, as: :taggable
	has_many :topics, through: :tags

	validates :name, :url, :description, presence: true

	validates :name, uniqueness: { scope: [:url, :description],
    message: "you can only subscribe to the same task once" }

  attr_accessor :subscribed

	# get all the tasks that the user with ID 'user_id' does NOT have a subscription for
	def self.get_for_select(user_id)
		# find user task ids
		user_task_ids = Subscription.where("user_id = ?", user_id).pluck(:task_id)
		user_task_ids |= [0]
		#tasks_for_select = find(:all, conditions: ['id NOT IN (?)', user_task_ids])
		tasks_for_select = where('id NOT IN (?)', user_task_ids)
	end

end
