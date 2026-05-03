require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "valid todo" do
    todo = Todo.new(title: "Buy groceries", user: users(:one), completed: false)
    assert todo.valid?
  end

  test "invalid without title" do
    todo = Todo.new(user: users(:one), completed: false)
    assert_not todo.valid?
    assert_includes todo.errors[:title], "can't be blank"
  end

  test "invalid without user" do
    todo = Todo.new(title: "Buy groceries", completed: false)
    assert_not todo.valid?
  end

  test "belongs to user" do
    assert_equal users(:one), todos(:one).user
  end
end
