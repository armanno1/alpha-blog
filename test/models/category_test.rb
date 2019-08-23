require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name:"Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name_should_be_valid" do
    @category = Category.new(name:"")
    assert_not @category.valid?
  end

  test "name_should_be_unique" do
    @category = Category.create(name:"hello")
    category2 = Category.new(name:"hello")
    assert_not category2.valid?
  end

  test "name_should_not_be_too_short" do
    @category.name = "a" * 2
    assert_not @category.valid?
  end

  test "name_should_not_be_too_long" do
    @category.name = "a" * 25
    assert_not @category.valid?
  end

end
