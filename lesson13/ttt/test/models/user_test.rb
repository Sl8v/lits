require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'should not save user without name' do
    user = User.new
    assert_not user.save
  end

  ## each new test
  setup do
    @user = users(:two)
  end

  # after each test
  teardown do
    Rails.cache.clear
  end

  test 'user is saved' do
    user = User.new(nickname: 'test', email: 'a@2.com')
    assert user.save!
  end

  test 'should not save user without nickname' do
    user = User.new(email: 'werw@werw.com')
    # assert_raises(ActiveRecord::StatementInvalid, SQLite3::ConstraintException){ user.save }
    assert_not user.save
  end

  test 'should update user' do
    @user.nickname = 'updated'
    @user.save!
    @user.reload
    assert_equal 'updated', @user.nickname
  end

  test 'should not update user' do
    @user.nickname = ''
    assert_raises("Nickname can't be blank") { user.save }
    # assert_not @user.save!
  end

  test 'should destroy user' do
    user = users(:one)
    assert_difference('User.count', -1) do
      # user = User.create(nickname: 'test', email: 'a@2.com')
      user.destroy
    end
  end

  # test 'should not destroy user' do
  #   assert_no_difference('User.count') do
  #     @user.destroy
  #   end
  # end

  test 'should not destroy user' do
    user = User.create(nickname: 'Admin', email: 'admin@gmail.com')
    assert_no_difference('User.count') do
      user.destroy
    end
  end
  # test 'should not destroy user' do
  #   # assert_difference('User.count', -1) do
  #   #   User.find(100).destroy
  #   # end
  #   @user.destroy
  #   assert false
  # end
end
