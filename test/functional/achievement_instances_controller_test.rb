require 'test_helper'

class AchievementInstancesControllerTest < ActionController::TestCase
  setup do
    @achievement_instance = achievement_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achievement_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achievement_instance" do
    assert_difference('AchievementInstance.count') do
      post :create, achievement_instance: { description: @achievement_instance.description }
    end

    assert_redirected_to achievement_instance_path(assigns(:achievement_instance))
  end

  test "should show achievement_instance" do
    get :show, id: @achievement_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achievement_instance
    assert_response :success
  end

  test "should update achievement_instance" do
    put :update, id: @achievement_instance, achievement_instance: { description: @achievement_instance.description }
    assert_redirected_to achievement_instance_path(assigns(:achievement_instance))
  end

  test "should destroy achievement_instance" do
    assert_difference('AchievementInstance.count', -1) do
      delete :destroy, id: @achievement_instance
    end

    assert_redirected_to achievement_instances_path
  end
end
