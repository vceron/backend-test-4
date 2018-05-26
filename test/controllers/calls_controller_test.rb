require 'test_helper'

class CallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calls_index_url
    assert_response :success
  end

  test "should get handle" do
    get calls_handle_url
    assert_response :success
  end

  test "should get destroy" do
    get calls_destroy_url
    assert_response :success
  end

end
