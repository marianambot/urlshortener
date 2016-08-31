require 'test_helper'

class FullurlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fullurl = fullurls(:one)
  end

  test "should get index" do
    get fullurls_url
    assert_response :success
  end

  test "should get new" do
    get new_fullurl_url
    assert_response :success
  end

  test "should create fullurl" do
    assert_difference('Fullurl.count') do
      post fullurls_url, params: { fullurl: { url_string: @fullurl.url_string } }
    end

    assert_redirected_to fullurl_url(Fullurl.last)
  end

  test "should show fullurl" do
    get fullurl_url(@fullurl)
    assert_response :success
  end

  test "should get edit" do
    get edit_fullurl_url(@fullurl)
    assert_response :success
  end

  test "should update fullurl" do
    patch fullurl_url(@fullurl), params: { fullurl: { url_string: @fullurl.url_string } }
    assert_redirected_to fullurl_url(@fullurl)
  end

  test "should destroy fullurl" do
    assert_difference('Fullurl.count', -1) do
      delete fullurl_url(@fullurl)
    end

    assert_redirected_to fullurls_url
  end
end
