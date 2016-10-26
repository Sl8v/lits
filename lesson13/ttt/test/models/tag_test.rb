require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @tag = tags(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test 'tag is saved' do
    tag = Tag.new(name: 'test')
    assert tag.save!
  end

  test 'should not save tag without name' do
    tag = Tag.new(name: '')
    # assert_raises(ActiveRecord::StatementInvalid, SQLite3::ConstraintException){ tag.save }
    assert_not tag.save
  end

  test 'should destroy tag' do
    assert_difference('Tag.count', -1) do
      @tag.destroy
    end
  end

  test 'should update tag' do
    @tag.name = 'updated'
    @tag.save
    @tag.reload
    assert_equal 'updated', @tag.name
  end

  test 'should not update tag' do
    @tag.name = ''
    assert_raises("Name can't be blank") { tag.save }
    # assert_not @tag.save!
    # @tag.save
    # @tag.reload
    # assert_equal 'updated', @tag.name
  end
end
