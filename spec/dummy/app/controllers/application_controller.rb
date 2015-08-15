class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :helpdesk_user,:helpdesk_admin?
  def helpdesk_user
    current_user
  end

  def helpdesk_admin?
    current_user.helpdesk_admin
  end
end
