require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @todo = todos(:one)
  end

  test "should redirect to login when not authenticated" do
    sign_out @user
    get todos_url
    assert_redirected_to new_user_session_url
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { title: "New Todo", body: "memo", due_date: Date.today, completed: false, tags: "work" } }
    end
    assert_redirected_to todos_url
  end

  test "should not create todo without title" do
    assert_no_difference("Todo.count") do
      post todos_url, params: { todo: { title: "", body: "memo" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { title: "Updated Title" } }
    assert_redirected_to todos_url
    assert_equal "Updated Title", @todo.reload.title
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end
    assert_redirected_to todos_url
  end

  test "should toggle todo completed" do
    patch toggle_todo_url(@todo)
    assert_redirected_to todos_url
    assert @todo.reload.completed
  end

  test "should not access other user todo" do
    other_todo = todos(:two)
    get todo_url(other_todo)
    assert_response :not_found
  end
end
