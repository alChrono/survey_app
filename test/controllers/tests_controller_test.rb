require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  setup do
    @test = tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test" do
    @request.env['HTTP_REFERER'] = 'survey/new'

    assert_difference('Test.count') do
      post :create, test: {survey: "1", question: "2"}
    end

    # no redirect success reloads survey question list
    assert_response :redirect
  end

  test "should show test" do
    get :show, id: @test
    assert_response :success
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete :destroy, id: @test
    end

    assert_redirected_to tests_path
  end

  test "should not add duplicate question to survey" do
    @request.env['HTTP_REFERER'] = 'survey/new'

    assert_no_difference('Test.count') do
      post :create, test: { survey_id: @test.survey_id.to_s, question_id: @test.question_id.to_s}
    end
  end
end
