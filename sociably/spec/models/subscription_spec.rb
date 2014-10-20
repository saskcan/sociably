require 'rails_helper'

describe Subscription do

	it "has a valid factory" do
		expect(FactoryGirl.create(:subscription)).to be_valid
	end

	it "is invalid without a user" do
		expect(FactoryGirl.build(:subscription, user: nil)).to_not be_valid
	end

	it "is invalid without a task" do
		expect(FactoryGirl.build(:subscription, task: nil)).to_not be_valid
	end

	it "cannot be repeated for each user and task" do
		subscription_one = FactoryGirl.create(:subscription)
		expect(FactoryGirl.build(:subscription, user: subscription_one.user, task: subscription_one.task)).to_not be_valid
	end

	it "defaults to a progress value of 0 if progress not given" do
		subscription = FactoryGirl.create(:subscription, progress: nil)
		expect(subscription.progress).to eq(0)
	end
end