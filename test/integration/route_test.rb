require 'test_helper'

class RouteTest < ActionDispatch::IntegrationTest
  
  test " path /login is working" do
  	get '/login'
  	assert_response :success
  end
  test " path /register is working" do
  	get '/register'
  	assert_response :success
  end

  test " path /logout is working" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end
end
