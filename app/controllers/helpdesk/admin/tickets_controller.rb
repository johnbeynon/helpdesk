class Helpdesk::Admin::TicketsController < Helpdesk::Admin::BaseController

  def index
    if params[:tickets] == 'unassigned'
      @tickets = Helpdesk::Ticket.unassigned
    elsif params[:tickets] == 'closed'
      @tickets = Helpdesk::Ticket.closed
    elsif params[:tickets] == 'active'
      @tickets = Helpdesk::Ticket.active
    elsif params[:tickets] == 'all'
      @tickets = Helpdesk::Ticket.all
    else
      @tickets = my_tickets.active
    end
    render 'list'
  end

  def assign
    @ticket = Helpdesk::Ticket.find(params[:id])
    if @ticket.update_column(:assignee_id, helpdesk_user)
      redirect_to admin_ticket_path,
        notice: t('helpdesk.tickets.is_now_assigned',subject: @ticket.subject)
    else
      redirect_to admin_ticket_path
    end
  end

  def new
    @ticket = Helpdesk::Ticket.new
    @ticket.status = Helpdesk::Ticket::STATUSES[0][0]
  end

  def edit
    @ticket = Helpdesk::Ticket.find(params[:id])

  end

  def show
    @ticket = Helpdesk::Ticket.find(params[:id])

  end

  def create
    @ticket = Helpdesk::Ticket.new(params[:ticket])
    if @ticket.save
      redirect_to admin_ticket_path(@ticket)
    else
      render action: "new"
    end
  end

  def update
    @ticket = Helpdesk::Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      unless @ticket.assignee
        @ticket.update_column(:assignee_id, helpdesk_user)
      end
      redirect_to admin_ticket_path
    else
      render action: "new"
    end
  end

end
