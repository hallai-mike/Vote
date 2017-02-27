require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "exampleuser", password: "testpass", password_confirmation: "testpass")
  end

  test "user from setup should be valid" do
    assert @user.valid?
  end

  test "username should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "username should be present" do
  	@user.username = ""
  	assert_not @user.valid?
  end

  test "username should not be too long" do
  	@user.username = "m" * 80
  	assert_not @user.valid?
  end

  test "password should not blank" do
  	@user.password = ""
  	@user.password_confirmation = ""
  	assert_not @user.valid?
  end

  test "password should not be too short" do
  	@user.password = "m" * 5
  	@user.password_confirmation = "m" * 5
  	assert_not @user.valid?
  end

end
