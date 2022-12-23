require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_index_url
    assert_response :success
  end

  test "should get ," do
    get articles_,_url
    assert_response :success
  end

  test "should get edit," do
    get articles_edit,_url
    assert_response :success
  end

  test "should get show" do
    get articles_show_url
    assert_response :success
  end

end
