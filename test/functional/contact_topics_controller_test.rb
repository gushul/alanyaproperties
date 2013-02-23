require 'test_helper'

class ContactTopicsControllerTest < ActionController::TestCase
  setup do
    @contact_topic = contact_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_topic" do
    assert_difference('ContactTopic.count') do
      post :create, contact_topic: {name: @contact_topic.name}
    end

    assert_redirected_to contact_topic_path(assigns(:contact_topic))
  end

  test "should show contact_topic" do
    get :show, id: @contact_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_topic
    assert_response :success
  end

  test "should update contact_topic" do
    put :update, id: @contact_topic, contact_topic: {name: @contact_topic.name}
    assert_redirected_to contact_topic_path(assigns(:contact_topic))
  end

  test "should destroy contact_topic" do
    assert_difference('ContactTopic.count', -1) do
      delete :destroy, id: @contact_topic
    end

    assert_redirected_to contact_topics_path
  end
end
