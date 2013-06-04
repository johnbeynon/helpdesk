class Helpdesk::Admin::TicketTypesController < Helpdesk::Admin::BaseController

  def index
    @ticket_types = Helpdesk::TicketType.all
  end

  def show
    @ticket_type = Helpdesk::TicketType.find(params[:id])
  end

  def new
    @ticket_type = Helpdesk::TicketType.new
  end

  def edit
    @ticket_type = Helpdesk::TicketType.find(params[:id])
  end

  def create
    @ticket_type = Helpdesk::TicketType.new(params[:ticket_type])
    if @ticket_type.save
      redirect_to admin_ticket_types_url, notice: 'Ticket type was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @ticket_type = Helpdesk::TicketType.find(params[:id])
    if @ticket_type.update_attributes(params[:ticket_type])
      redirect_to admin_ticket_types_url, notice: 'Ticket type was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @ticket_type = Helpdesk::TicketType.find(params[:id])
    @ticket_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_ticket_types_url }
      format.json { head :no_content }
    end
  end
end