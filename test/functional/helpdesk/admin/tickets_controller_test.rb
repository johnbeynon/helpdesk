require 'test_helper'

module Helpdesk
  class Admin::TicketsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
