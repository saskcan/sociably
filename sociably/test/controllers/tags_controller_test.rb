require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  setup :login_as_james
  
  setup do
    @tag = tags(:tag_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, tag: { taggable_id: @tag.taggable_id, taggable_type: @tag.taggable_type, topic_id: @tag.topic_id }
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should show tag" do
    get :show, id: @tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag
    assert_response :success
  end

  test "should update tag" do
    patch :update, id: @tag, tag: { taggable_id: @tag.taggable_id, taggable_type: @tag.taggable_type, topic_id: @tag.topic_id }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: @tag
    end

    assert_redirected_to tags_path
  end
end
