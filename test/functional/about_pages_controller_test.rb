require 'test_helper'

class AboutPagesControllerTest < ActionController::TestCase
  setup do
    @about_page = about_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:about_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create about_page" do
    assert_difference('AboutPage.count') do
      post :create, about_page: { body: @about_page.body, slug: @about_page.slug, title: @about_page.title, url: @about_page.url }
    end

    assert_redirected_to about_page_path(assigns(:about_page))
  end

  test "should show about_page" do
    get :show, id: @about_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @about_page
    assert_response :success
  end

  test "should update about_page" do
    put :update, id: @about_page, about_page: { body: @about_page.body, slug: @about_page.slug, title: @about_page.title, url: @about_page.url }
    assert_redirected_to about_page_path(assigns(:about_page))
  end

  test "should destroy about_page" do
    assert_difference('AboutPage.count', -1) do
      delete :destroy, id: @about_page
    end

    assert_redirected_to about_pages_path
  end
end
