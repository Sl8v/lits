require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @comment = comments(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test 'comment is saved' do
    comment = Comment.new(body: 'test', twit_id: 1, user_id: 1)
    assert comment.save!
  end

  test 'should not save comment without body' do
    comment = Comment.new(body: '', twit_id: 1, user_id: 1)
    # assert_raises(ActiveRecord::StatementInvalid, SQLite3::ConstraintException){ comment.save }
    assert_not comment.save
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      @comment.destroy
    end
  end

  test 'should update comment' do
    @comment.body = 'updated'
    @comment.save
    @comment.reload
    assert_equal 'updated', @comment.body
  end

  test 'should not update comment' do
    @comment.body = ''
    assert_raises("Body can't be blank") { comment.save }
    # assert_not @comment.save!
    # @comment.save
    # @comment.reload
    # assert_equal 'updated', @comment.body
  end
end
