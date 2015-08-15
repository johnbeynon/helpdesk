module Helpdesk
  class ApplicationController < ::ApplicationController
    before_filter :ensure_user, :if => Proc.new { Helpdesk.require_user }

    helper Helpdesk::Engine.helpers

    layout 'helpdesk/user'

    def ensure_user
      unless helpdesk_user
        redirect_to main_app.send(Helpdesk.sign_in_url)
      end
    end

    def default_url_options(options={})
      { :locale => I18n.locale}
    end

  end
end
