require 'test_helper'

class Admin::UsefulNewsControllerTest < ActionController::TestCase
  setup do
    @admin_useful_news = admin_useful_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_useful_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_useful_news" do
    assert_difference('Admin::UsefulNews.count') do
      post :create, admin_useful_news: {  }
    end

    assert_redirected_to admin_useful_news_path(assigns(:admin_useful_news))
  end

  test "should show admin_useful_news" do
    get :show, id: @admin_useful_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_useful_news
    assert_response :success
  end

  test "should update admin_useful_news" do
    put :update, id: @admin_useful_news, admin_useful_news: {  }
    assert_redirected_to admin_useful_news_path(assigns(:admin_useful_news))
  end

  test "should destroy admin_useful_news" do
    assert_difference('Admin::UsefulNews.count', -1) do
      delete :destroy, id: @admin_useful_news
    end

    assert_redirected_to admin_useful_news_index_path
  end
end
