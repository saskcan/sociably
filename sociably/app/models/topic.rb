class Topic < ActiveRecord::Base

	has_many :tags

	validates :name, presence: true
	validates :name, uniqueness: true
	
end
