module Helpdesk
  class Admin::BaseController < ::ApplicationController
    layout 'helpdesk/admin'
    
    before_filter :authenticate_helpdesk_admin
    before_filter :my_tickets

    private

    def helpdesk_admin?
      helpdesk_user && (can? :manage, 'helpdesk')
    end


    def authenticate_helpdesk_admin
      unless helpdesk_admin?
        redirect_to root_url
      end
    end

    def my_tickets
      @my_tickets = Ticket.where('assignee_id = ?', helpdesk_user.id)
    end
  end
end
