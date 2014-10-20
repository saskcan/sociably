FactoryGirl.define do
	factory :subscription do
		user
		task
		progress { 
			a = Array.new(21)
			(0..20).each do |n|
				a[n] = n * 0.05
			end
			a.shuffle[0]
		 }
	end
end