module Helpdesk
  class ApplicationController < ApplicationController
    before_filter :ensure_user, :if => Proc.new { Helpdesk.require_user }

    helper Helpdesk::Engine.helpers



    layout 'helpdesk/user'

    def ensure_user
      if !helpdesk_user
        redirect_to main_app.send(Helpdesk.sign_in_url)
      end
    end

    def default_url_options(options={})
      { :locale => I18n.locale}
    end

    # def helpdesk_admin?
    #   helpdesk_user && (can? :manage, 'helpdesk')
    # end
    # helper_method :helpdesk_admin?



  end
end
