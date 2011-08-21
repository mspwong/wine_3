require 'test_helper'

class WhyNots::AjaxControllerTest < ActionController::TestCase

  test "should Get ajax page" do
    get :ajax_page
    assert_response :success
  end

  test "should Get wines" do
    get :get_wines, :format => :json
    assert_response :success
    assert_not_nil @response.body
    assert_equal 200, @response.status
    #json = JSON.parse(@response.body)
    #assert json
  end

  test "should get Not Acceptable response when Get wines with wrong response type" do
    get :get_wines, :format => :html
    assert_response :not_acceptable
    assert_equal 406, @response.status
  end

  test "should Get wine by known id" do
    get :get_wine, {:id => 613896708, :format => :json}
    assert_response :success
    assert_equal 200, @response.status
  end

  test "should get No Content when Get wine of unknown id" do
    get :get_wine, {:id => 99999, :format => :json}
    assert_response :success
    assert_response :no_content
    assert_equal 204, @response.status
    assert_not_equal 200, @response.status
  end

  test "should Post wine by known id" do
    post :get_wine, {:id => 613896708, :format => :json}
    assert_response :success
    assert_equal 200, @response.status
  end

  test "should get No Content response when Post wine with unknown id" do
    post :post_wine, {:id => 99999, :format => :json}
    assert_response :success
    assert_equal 204, @response.status
    assert_not_equal 200, @response.status
    end

end
