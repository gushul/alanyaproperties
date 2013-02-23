require 'test_helper'

class TurkeyNewsControllerTest < ActionController::TestCase
  setup do
    @turkey_news = turkey_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turkey_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turkey_news" do
    assert_difference('TurkeyNews.count') do
      post :create, turkey_news: {body: @turkey_news.body, name: @turkey_news.name, photo: @turkey_news.photo, slug: @turkey_news.slug}
    end

    assert_redirected_to turkey_news_path(assigns(:turkey_news))
  end

  test "should show turkey_news" do
    get :show, id: @turkey_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turkey_news
    assert_response :success
  end

  test "should update turkey_news" do
    put :update, id: @turkey_news, turkey_news: {body: @turkey_news.body, name: @turkey_news.name, photo: @turkey_news.photo, slug: @turkey_news.slug}
    assert_redirected_to turkey_news_path(assigns(:turkey_news))
  end

  test "should destroy turkey_news" do
    assert_difference('TurkeyNews.count', -1) do
      delete :destroy, id: @turkey_news
    end

    assert_redirected_to turkey_news_index_path
  end
end
