require 'rails_helper'

describe Topic do
	
	it "has a valid factory" do
		expect(FactoryGirl.create(:topic)).to be_valid
	end

	it "is invalid without a name" do
		expect(FactoryGirl.build(:topic, name: nil)).to_not be_valid
	end

	it "must be unique" do
		topic_one = FactoryGirl.create(:topic)
		expect(FactoryGirl.build(:topic, name: topic_one.name)).to_not be_valid
	end

end