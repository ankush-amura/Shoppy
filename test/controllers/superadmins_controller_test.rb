require 'test_helper'

class SuperadminsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get superadmins_new_url
    assert_response :success
  end

  test "should get edit" do
    get superadmins_edit_url
    assert_response :success
  end

  test "should get index" do
    get superadmins_index_url
    assert_response :success
  end

end
