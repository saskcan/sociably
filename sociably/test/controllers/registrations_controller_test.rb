require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase

  setup do
  	@request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "sign-up form has expected elements" do
  	get :new
  	assert_select "form[id=new_user][action=/users]" do
  		assert_select "input[id=user_name]"
  		assert_select "input[id=user_email]"
  		assert_select "input[id=user_password]"
  		assert_select "input[id=user_password_confirmation]"
  		assert_select "input[type=submit]"
  	end
  end

  test "user can sign-up from sign-up form" do
  	assert_difference('User.count', 1) do
  		post :create, user: {
  			name: "matt",
  			email: "matt@sociably.com",
  			password: "secret123",
  			password_confirmation: "secret123"}
  	end
  end

end