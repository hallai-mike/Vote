require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  def setup
    @issue = Issue.new(title: "test", desc1: "foo", desc2: "bar")
  end

  test "issue from setup should be valid" do
    assert @issue.valid?
  end

  test "title should be unique" do
    dup_issue = @issue.dup
    @issue.save
    assert_not dup_issue.valid?
  end

  test "title should be present" do
    @issue.title = ""
    assert_not @issue.valid?
  end

  test "title should not be too long" do
    @issue.title = "m" * 400
    assert_not @issue.valid?
  end

  test "desc1 CAN be blank" do
    @issue.desc1 = ""
    assert @issue.valid?
  end

  test "desc2 CAN be blank" do
    @issue.desc2 = ""
    assert @issue.valid?
  end
end
