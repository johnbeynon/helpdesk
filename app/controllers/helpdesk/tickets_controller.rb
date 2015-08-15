module Helpdesk
  class TicketsController < Helpdesk::ApplicationController

    before_filter :ensure_user
    helper TicketsHelper

    # GET /tickets
    # GET /tickets.json
    def index
      if params[:tickets] == 'closed'
        @tickets = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).closed.page(params[:page])
      else
        @tickets = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).active.page(params[:page])
      end


      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tickets }
      end
    end

    # GET /tickets/1
    # GET /tickets/1.json
    def show
      @tickets_count = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).active.count
      @ticket = Helpdesk::Ticket.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @ticket }
      end
    end

    # GET /tickets/new
    # GET /tickets/new.json
    def new
      @tickets_count = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).active.count
      @ticket = Helpdesk::Ticket.new
      @ticket.status = Helpdesk::Ticket::STATUSES[0][0]

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @ticket }
      end
    end

    def create
      @ticket = Helpdesk::Ticket.new(ticket_params)
      @ticket.requester = helpdesk_user
      @ticket.status = Helpdesk::Ticket::STATUSES[0][0]

      respond_to do |format|
        if @ticket.save
          format.html { redirect_to tickets_url, notice: 'Ticket was successfully created.' }
          format.json { render json: @ticket, status: :created, location: @ticket }
        else
          format.html { render action: "new" }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /tickets/1
    # PUT /tickets/1.json
    def update
      @ticket = Helpdesk::Ticket.find(params[:id])

      respond_to do |format|
        if @ticket.update_attributes(ticket_params)
          format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.'}
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end


    private

    def ticket_params
      params.require(:ticket).permit( :ticket_type_id, :subject, :description,comments_attributes:[:author_id, :comment, :public])
    end

  end
end
