require 'faker'

FactoryGirl.define do
	factory :topic do
		name { Faker::Hacker.noun }
	end
end