class Contribution < ActiveRecord::Base
	belongs_to :person
	belongs_to :role
	belongs_to :contributable, polymorphic: :true
end
