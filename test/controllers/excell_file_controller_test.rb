require 'test_helper'

class ExcellFileControllerTest < ActionDispatch::IntegrationTest
  test "should get converet" do
    get excell_file_converet_url
    assert_response :success
  end

end
