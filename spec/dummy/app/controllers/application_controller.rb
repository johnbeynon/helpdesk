class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def helpdesk_user
    current_user
  end
  
  helper_method :helpdesk_user
end
