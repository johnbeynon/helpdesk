class AddTrClassToTicketType < ActiveRecord::Migration
  def change
    add_column :helpdesk_ticket_types, :tr_class, :string
  end
end
