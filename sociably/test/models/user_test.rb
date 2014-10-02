require 'test_helper'

class UserTest < ActiveSupport::TestCase

test "user name cannot be blank" do
	assert_difference('User.count', 0) do
		User.create(name: '')
	end
end

end
