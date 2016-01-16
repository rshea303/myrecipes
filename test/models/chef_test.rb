require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
  	@chef = Chef.new(chefname: "Bobby Flay", email: "bobby@example.com")
  end

  test "chef is valid with name and email" do 
    assert @chef.valid?
  end

  test "must have chefname" do
    @chef.chefname = nil

    assert_not @chef.valid?, "must have a chefname"
  end

  test "chefname is at least 3 characters in length" do
    @chef.chefname = "aa"

    assert_not @chef.valid?, "name must be at least 3 characters"
  end

  test "chefname is at most 40 characters in length" do
    @chef.chefname = "a" * 41

    assert_not @chef.valid?, "name must be at most 40 characters"
  end

  test "must have email" do
  	@chef.email = nil

  	assert_not @chef.valid?, "must have email"
  end

  test "email must be unique" do
  	chef2 = Chef.create(chefname: 'test', email: 'Bobby@example.com')

  	assert_not @chef.valid?, "email must be unique"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com first.last@eem.au]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, "#{va.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example.  eee@i_am_.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, "#{ia.inspect} should be invalid"
    end
  end
end
