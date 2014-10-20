FactoryGirl.define do
	factory :user_tag, class: Tag do
		topic
		association :taggable, factory: :user
	end

	factory :task_tag, class: Tag do
		topic
		association :taggable, factory: :task
	end
end