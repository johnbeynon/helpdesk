module Helpdesk
  class TicketsController < Helpdesk::ApplicationController
    # GET /tickets
    # GET /tickets.json
    def index
      if params[:tickets] == 'closed'
        @tickets = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).closed.page(params[:page])
        @tickets_count = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).active.count
      else
        @tickets = Helpdesk::Ticket.where(:requester_id => helpdesk_user.id).active.page(params[:page])
        @tickets_count = @tickets.size
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

    # GET /tickets/1/edit
    def edit
      @ticket = Helpdesk::Ticket.find(params[:id])
    end

    # POST /tickets
    # POST /tickets.json
    def create
      @ticket = Helpdesk::Ticket.new(params[:ticket])
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
        if @ticket.update_attributes(params[:ticket])
          format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

  end
end
