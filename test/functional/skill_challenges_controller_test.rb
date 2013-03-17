require 'test_helper'

class SkillChallengesControllerTest < ActionController::TestCase
  setup do
    @skill_challenge = skill_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_challenge" do
    assert_difference('SkillChallenge.count') do
      post :create, skill_challenge: { completed: @skill_challenge.completed, complexity: @skill_challenge.complexity, context: @skill_challenge.context, failure: @skill_challenge.failure, level: @skill_challenge.level, name: @skill_challenge.name, primary_skill: @skill_challenge.primary_skill, secondary_skill: @skill_challenge.secondary_skill, succeded: @skill_challenge.succeded, success: @skill_challenge.success }
    end

    assert_redirected_to skill_challenge_path(assigns(:skill_challenge))
  end

  test "should show skill_challenge" do
    get :show, id: @skill_challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_challenge
    assert_response :success
  end

  test "should update skill_challenge" do
    put :update, id: @skill_challenge, skill_challenge: { completed: @skill_challenge.completed, complexity: @skill_challenge.complexity, context: @skill_challenge.context, failure: @skill_challenge.failure, level: @skill_challenge.level, name: @skill_challenge.name, primary_skill: @skill_challenge.primary_skill, secondary_skill: @skill_challenge.secondary_skill, succeded: @skill_challenge.succeded, success: @skill_challenge.success }
    assert_redirected_to skill_challenge_path(assigns(:skill_challenge))
  end

  test "should destroy skill_challenge" do
    assert_difference('SkillChallenge.count', -1) do
      delete :destroy, id: @skill_challenge
    end

    assert_redirected_to skill_challenges_path
  end
end
