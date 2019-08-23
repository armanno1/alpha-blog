require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name:"Sports")
    @user = User.create(username: "John1234", email: "john@gmail.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    post login_path, params: { session: { email: "john@gmail.com", password: "password"} }
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect if not admin" do
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: "Another onerr" } }
    end
    assert_redirected_to categories_path
  end

end
