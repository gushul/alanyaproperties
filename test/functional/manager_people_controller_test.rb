require 'test_helper'

class ManagerPeopleControllerTest < ActionController::TestCase
  setup do
    @manager_person = manager_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_person" do
    assert_difference('ManagerPerson.count') do
      post :create, manager_person: {  }
    end

    assert_redirected_to manager_person_path(assigns(:manager_person))
  end

  test "should show manager_person" do
    get :show, id: @manager_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_person
    assert_response :success
  end

  test "should update manager_person" do
    put :update, id: @manager_person, manager_person: {  }
    assert_redirected_to manager_person_path(assigns(:manager_person))
  end

  test "should destroy manager_person" do
    assert_difference('ManagerPerson.count', -1) do
      delete :destroy, id: @manager_person
    end

    assert_redirected_to manager_people_path
  end
end
