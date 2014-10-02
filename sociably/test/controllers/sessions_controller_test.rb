require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  setup do
  	@request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "a user who logs out gets taken to the login page" do
    login_as_james
    delete :destroy
    assert_nil session[:user_id]
    assert_redirected_to(new_user_session_path)
  end

  test "the menu bar is not visible to unauthenticated users" do
    get :new
    assert_select "#topNav", false
  end

  test "the sign-in page has expected elements" do
    get :new
    assert_select "#introText"
    assert_select "form[id=new_user][action=/users/sign_in]" do
      assert_select "input[id=user_email]"
      assert_select "input[id=user_password]"
    end
  end

  test "an authenticated user gets taken to a list of their subscriptions" do
    post :create, user: {
        email: "james@sociably.com",
        password: "secret123" }
    assert_redirected_to(subscriptions_path)
  end

end