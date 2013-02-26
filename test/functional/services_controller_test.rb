require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_mailer" do
    assert_difference('ServiceMailer.count') do
      post :create, service_mailer: {body: @service.body, is_main: @service.is_main, name: @service.name, slug: @service.slug}
    end

    assert_redirected_to service_path(assigns(:service_mailer))
  end

  test "should show service_mailer" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update service_mailer" do
    put :update, id: @service, service_mailer: {body: @service.body, is_main: @service.is_main, name: @service.name, slug: @service.slug}
    assert_redirected_to service_path(assigns(:service_mailer))
  end

  test "should destroy service_mailer" do
    assert_difference('ServiceMailer.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
