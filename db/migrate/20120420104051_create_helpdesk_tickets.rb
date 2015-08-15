class CreateHelpdeskTickets < ActiveRecord::Migration
  def change
    create_table :helpdesk_tickets do |t|
      t.string :subject
      t.text :description
      t.integer :requester_id
      t.integer :assignee_id
      t.string :status
      t.integer :ticket_type_id
      
      t.timestamps
    end
  end
end
