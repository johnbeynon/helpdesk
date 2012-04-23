module Helpdesk
  class Admin::TicketsController < Admin::BaseController
    def index
      if params[:tickets] == 'unassigned'
        @tickets = Ticket.unassigned
      else
        @tickets = my_tickets.all
      end
    end
    
    def new
      @ticket = Ticket.new
    end

    def show
      @ticket = Ticket.find(params[:id])
    end

    def create
      if Ticket.create(params[:ticket])
        redirect_to admin_root_url
      end
    end
  end
end
