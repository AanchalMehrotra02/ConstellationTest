require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "a user must enter content" do
 		status = Status.new
 		assert !status.save
 		assert !status.errors[:content].empty?
  end

  test "content must be 2 letter long" do
 		status = Status.new
 		status.content = "H"
 		assert !status.save
 		assert !status.errors[:content].empty?
  end

  test "must have user id for status" do
		status = Status.new
 		status.content = "Hello"
 		assert !status.save
 		assert !status.errors[:user_id].empty?
  end
end
