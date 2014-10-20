class Tag < ActiveRecord::Base

	belongs_to :taggable, polymorphic: true
	belongs_to :topic

	validates :topic_id, presence: true
	validates :taggable_id, presence: true
	validates :topic_id, uniqueness: { scope: [:taggable_id, :taggable_type] }

end
