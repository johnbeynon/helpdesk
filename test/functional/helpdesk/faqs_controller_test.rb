require 'test_helper'

module Helpdesk
  class FaqsControllerTest < ActionController::TestCase
    setup do
      @faq = faqs(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:faqs)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create faq" do
      assert_difference('Faq.count') do
        post :create, faq: { active: @faq.active, position: @faq.position, text: @faq.text, title: @faq.title }
      end
  
      assert_redirected_to faq_path(assigns(:faq))
    end
  
    test "should show faq" do
      get :show, id: @faq
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @faq
      assert_response :success
    end
  
    test "should update faq" do
      put :update, id: @faq, faq: { active: @faq.active, position: @faq.position, text: @faq.text, title: @faq.title }
      assert_redirected_to faq_path(assigns(:faq))
    end
  
    test "should destroy faq" do
      assert_difference('Faq.count', -1) do
        delete :destroy, id: @faq
      end
  
      assert_redirected_to faqs_path
    end
  end
end
