require 'test_helper'

class TwitTest < ActiveSupport::TestCase
  setup do
    @twit = twits(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test 'twit is saved' do
    twit = Twit.new(content: 'test', user_id: 1)
    assert twit.save!
  end

  test 'should not save twit without content' do
    twit = Twit.new(user_id: 1)
    # assert_raises(ActiveRecord::StatementInvalid, SQLite3::ConstraintException){ twit.save }
    assert_not twit.save
  end

  test 'should destroy twit' do
    assert_difference('Twit.count', -1) do
      @twit.destroy
    end
  end

  test 'should update twit' do
    @twit.content = 'updated'
    @twit.save
    @twit.reload
    assert_equal 'updated', @twit.content
  end

  test 'should not update twit' do
    @twit.content = ''
    assert_raises("Content can't be blank") { twit.save }
    # assert_not @twit.save!
    # @twit.save
    # @twit.reload
    # assert_equal 'updated', @twit.content
  end

  # test 'twit is deleted' do
  # twit = Twit.new(content: 'test', user_id: 1)

  # assert twit.save!
  # end

  # test 'twit is saved' do
  #   twit = Twit.new(content: 'test', user_id: 1)
  #   assert twit.save!
  # end
end
