require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "failing_create" do
    developer = Developer.new
    assert_equal false, developer.save
    assert_equal 2, developer.errors.count
    assert developer.errors[:name]

  end

  test "create" do
    developer = Developer.new(
      :name => 'Atari',

    )
  assert developer.save
  end
end
