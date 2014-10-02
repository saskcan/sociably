require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

test "user cannot be empty" do
	assert_raise ActiveRecord::StatementInvalid do
		subscription = Subscription.new(task_id: tasks(:homework).to_param)
		subscription.save(validate: false)
	end
	subscription = Subscription.new
	subscription.task_id = tasks(:homework).to_param
	assert !subscription.valid?
end

test "task cannot be empty" do
	assert_raise ActiveRecord::StatementInvalid do
		subscription = Subscription.new(user_id: users(:james).to_param)
		subscription.save(validate: false)
	end
	subscription = Subscription.new
	subscription.user_id = users(:james).to_param
	assert !subscription.valid?
end

test "a user can only subscribe to the same task once" do
	assert_difference('Subscription.count', 0) do
		subscription = Subscription.new(user_id: users(:james).to_param)
		subscription.task = users(:james).tasks.first
		subscription.save
	end
end

test "a new subscription should default to a progress value of 0" do
	subscription = Subscription.create(user_id: users(:james).to_param, task_id: tasks(:cut_grass).to_param)
	assert_equal 0, subscription.progress
end

end