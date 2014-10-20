require 'faker'

FactoryGirl.define do
	factory :user do |f|
		f.name 				 { Faker::Name.first_name	  	 }
		f.email 			 { Faker::Internet.email 			 }
		f.password		 { Faker::Internet.password(8) }
		f.confirmed_at { Faker::Time.backward(1) 		 }
	end
end