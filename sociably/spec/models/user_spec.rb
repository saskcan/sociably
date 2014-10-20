require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(FactoryGirl.create(:user)).to	be_valid
	end

	it "is invalid without a name" do
		expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
	end

	it "is invalid without an email" do
		expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
	end

	it "is invalid without a password" do
		expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
	end

	it "is invalid with password that is less than 8 characters" do
		expect(FactoryGirl.build(:user, password: 'abc1234')).to_not be_valid
	end

	it "must have a unique email" do
		user_one = FactoryGirl.create(:user)
		expect(FactoryGirl.build(:user, email: user_one.email)).to_not be_valid
	end

end