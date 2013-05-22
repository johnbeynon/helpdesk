module Helpdesk
  class ApplicationController < ActionController::Base
    before_filter :ensure_user, :if => Proc.new { Helpdesk.require_user }

    def ensure_user
      if !helpdesk_user
        redirect_to main_app.send(Helpdesk.sign_in_url)
      end
    end

    def helpdesk_admin?
      helpdesk_user && (can? :manage, 'helpdesk')
    end
    helper_method :helpdesk_admin?
    




  end
end
