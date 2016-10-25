require 'test_helper'

class TwitTest < ActiveSupport::TestCase

  test "twit is saved" do
     twit = Twit.new(content: 'test', user_id: 1)
      assert twit.save!
   end

  test "should not save twit without content" do
    twit = Twit.new(user_id: 1)
    #assert_raises(ActiveRecord::StatementInvalid, SQLite3::ConstraintException){ twit.save }
    assert_not twit.save
  end
end
