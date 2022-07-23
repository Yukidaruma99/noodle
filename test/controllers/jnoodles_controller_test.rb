require 'test_helper'

class JnoodlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jnoodles_index_url
    assert_response :success
  end

  test "should get show" do
    get jnoodles_show_url
    assert_response :success
  end

  test "should get new" do
    get jnoodles_new_url
    assert_response :success
  end

  test "should get edit" do
    get jnoodles_edit_url
    assert_response :success
  end

end
