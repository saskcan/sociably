require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase

  setup :login_as_james

  setup do
    @subscription = subscriptions(:subscription_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, subscription: { progress: @subscription.progress, task_id: tasks(:task_two).id, user_id: users(:user_two).id  }
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, id: @subscription.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription
    assert_response :success
  end

  test "should update subscription" do
    patch :update, id: @subscription, subscription: { progress: @subscription.progress, task_id: @subscription.task_id, user_id: @subscription.user_id }
    assert_redirected_to subscriptions_path
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, id: @subscription
    end

    assert_redirected_to subscriptions_path
  end

  test "message is present on index when no subscriptions present" do
    Subscription.delete_all
    get :index
    assert_select "#noSubMsg"
  end

  test "task names are shown on subscription index" do
    get :index
    assert_select "td", "Homework"
  end

  test "other users' tasks are hidden on subscription index" do
    get :index
    assert_select "td", { text: "Task one", count: 0 }
  end

  test "dropdown list shows unsubscribed task" do
    get :new
    assert_select "option", "Task one"
  end

  test "dropdown list doesn't show subscribed task" do
    get :new
    assert_select "option", { text: "Homework", count: 0 }
  end

  test "when a user is subscribed to all tasks, they are redirected back to index" do
    user = users(:james)
    Task.all.each do |t|
      unless user.tasks.include?(t)
        Subscription.create(user_id: user.id, task_id: t.id)
      end
    end
    get :new
    assert_redirected_to(subscriptions_path)
  end

end