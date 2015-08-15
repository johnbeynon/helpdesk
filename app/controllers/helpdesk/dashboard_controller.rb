module Helpdesk
  class DashboardController < Helpdesk::ApplicationController


    before_filter :my_tickets

    def index
    end


    def show
    end


    def my_tickets
      @my_tickets = Helpdesk::Ticket
      .includes(:comments=>[:author])
      .includes(:requester)
      .includes(:assignee)
      .includes(:ticket_type)
      .where('requester_id = ?', helpdesk_user.id)
    end


  end
end
