require 'test_helper'

class ShorturlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shorturl = shorturls(:one)
  end

  test "should get index" do
    get shorturls_url
    assert_response :success
  end

  test "should get new" do
    get new_shorturl_url
    assert_response :success
  end

  test "should create shorturl" do
    assert_difference('Shorturl.count') do
      post shorturls_url, params: { shorturl: { url_full_id: @shorturl.url_full_id, url_ip_access: @shorturl.url_ip_access, url_num_accesses: @shorturl.url_num_accesses, url_string: @shorturl.url_string } }
    end

    assert_redirected_to shorturl_url(Shorturl.last)
  end

  test "should show shorturl" do
    get shorturl_url(@shorturl)
    assert_response :success
  end

  test "should get edit" do
    get edit_shorturl_url(@shorturl)
    assert_response :success
  end

  test "should update shorturl" do
    patch shorturl_url(@shorturl), params: { shorturl: { url_full_id: @shorturl.url_full_id, url_ip_access: @shorturl.url_ip_access, url_num_accesses: @shorturl.url_num_accesses, url_string: @shorturl.url_string } }
    assert_redirected_to shorturl_url(@shorturl)
  end

  test "should destroy shorturl" do
    assert_difference('Shorturl.count', -1) do
      delete shorturl_url(@shorturl)
    end

    assert_redirected_to shorturls_url
  end
end
