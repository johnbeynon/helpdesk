module Helpdesk
  class Admin::BaseController < ApplicationController
    layout 'helpdesk/admin'
    
    before_filter :authenticate_helpdesk_admin
    before_filter :my_tickets

    private

    def authenticate_helpdesk_admin
      if !helpdesk_user || !helpdesk_user.helpdesk_admin?
        redirect_to root_url
      end
    end

    def my_tickets
      @my_tickets = Ticket.where('assignee_id = ?', helpdesk_user.id)
    end
  end
end
