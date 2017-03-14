require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { Class_Year: @user.Class_Year, Courses_Taken: @user.Courses_Taken, Days_Available: @user.Days_Available, Groupid: @user.Groupid, Preffered_Programming_Languages: @user.Preffered_Programming_Languages, Project_Interests: @user.Project_Interests, email: @user.email, name: @user.name }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { Class_Year: @user.Class_Year, Courses_Taken: @user.Courses_Taken, Days_Available: @user.Days_Available, Groupid: @user.Groupid, Preffered_Programming_Languages: @user.Preffered_Programming_Languages, Project_Interests: @user.Project_Interests, email: @user.email, name: @user.name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
