require "test_helper"

class Api::V1::ExamResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_exam_results_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_exam_results_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_exam_results_destroy_url
    assert_response :success
  end
end
