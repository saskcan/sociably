require 'rails_helper'

describe Tag do
	
	it "has a valid factory for user tags" do
		expect(FactoryGirl.create(:user_tag)).to be_valid
	end

	it "has a valid factory for task tags" do
		expect(FactoryGirl.create(:task_tag)).to be_valid
	end

	it "is invalid without a topic when it is a user tag" do
		expect(FactoryGirl.build(:user_tag, topic: nil)).to_not be_valid
	end

	it "is invalid without a topic when it is a task tag" do
		expect(FactoryGirl.build(:task_tag, topic: nil)).to_not be_valid
	end

	it "is invalid without a user when it is a user tag" do
		expect(FactoryGirl.build(:user_tag, taggable: nil)).to_not be_valid
	end

	it "is invalid without a task when it is a task tag" do
		expect(FactoryGirl.build(:task_tag, taggable: nil)).to_not be_valid
	end

	it "must be unique when it is a user tag" do
		tag_one = FactoryGirl.create(:user_tag)
		expect(FactoryGirl.build(:user_tag, taggable: tag_one.taggable, topic: tag_one.topic)).to_not be_valid
	end

	it "must be unique when it is a task tag" do
		tag_one = FactoryGirl.create(:task_tag)
		expect(FactoryGirl.build(:task_tag, taggable: tag_one.taggable, topic: tag_one.topic)).to_not be_valid
	end

end