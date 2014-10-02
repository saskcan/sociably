require 'test_helper'

class TaskTest < ActiveSupport::TestCase

test "a task must have a name" do
	assert_difference('Task.count', 0) do
		Task.create(url: "www.google.com", description: "Search the web!")
	end
end

test "a task must have a url" do
	assert_difference('Task.count', 0) do
		Task.create(name: "Use Google", description: "Search the web!")
	end
end

test "a task must have a description" do
	assert_difference('Task.count', 0) do
		Task.create(name: "Use Google", url: "www.google.com")
	end
end

test "a task must be unique" do
	original = Task.first
	assert_difference('Task.count', 0) do
		Task.create(name: original.name, url: original.url, description: original.description)
	end
end

end
