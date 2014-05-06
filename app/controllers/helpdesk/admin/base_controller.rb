module Helpdesk
  module Admin
    class BaseController < Helpdesk::ApplicationController

      helper Helpdesk::Engine.helpers
      # helper Helpdesk::ApplicationHelper
      before_filter :authenticate_helpdesk_admin
      before_filter :my_tickets

      layout 'helpdesk/admin'

      private
        #methods helpdesk_user & helpdesk_admin? - must by defined in file app/application_controller

        def authenticate_helpdesk_admin
          unless helpdesk_admin?
            redirect_to main_app.root_url, notice:'You have no power here!'
          end
        end

        def my_tickets
          @my_tickets = Helpdesk::Ticket
          .includes(:comments=>[:author])
          .includes(:requester)
          .includes(:assignee)
          .includes(:ticket_type)
          .where('assignee_id = ?', helpdesk_user.id)
          .active
        end
    end
  end
end
