require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

end
