class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

	has_many :subscriptions, dependent: :destroy
	#has_many :tasks, through: :subscriptions
	has_many :tags, as: :taggable
	has_many :topics, through: :tags

	validates :name, presence: true

	def task_count
		tasks.count
	end
	
end
