require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "chicken parm", 
    	                 summary: "this is the best chicken parm recipe ever",
    	                 description: "heat oil, add onions, add chicken, cook for 20 minutes")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe should be invalid without name" do
    @recipe.name = nil

    assert_not @recipe.valid?, "valid recipe requires name"
  end

  test "name must have at least 5 chars" do
  	@recipe.name = "x" * 4

  	assert_not @recipe.valid?, "name length must be at least 5 characters"
  end

  test "name must have at most 100 chars" do
  	@recipe.name = "x" * 101

  	assert_not @recipe.valid?, "name length must be at most 100 characters"
  end

  test "recipe should be invalid without a summary" do
    @recipe.summary = nil

    assert_not @recipe.valid?
  end

  test "summary must have at least 10 characters" do
    @recipe.summary = "a" * 9

    assert_not @recipe.valid?
  end

  test "summary must have at most 150 characters" do
    @recipe.summary = "a" * 151

    assert_not @recipe.valid?
  end

  test "recipe should be invalid without a description" do
    @recipe.description = nil

    assert_not @recipe.valid?
  end

  test "description must have at least 20 characters" do
    @recipe.description = "a" * 19

    assert_not @recipe.valid?
  end

  test "description must have at most 500 characters" do
    @recipe.description = "a" * 501

    assert_not @recipe.valid?
  end


end
