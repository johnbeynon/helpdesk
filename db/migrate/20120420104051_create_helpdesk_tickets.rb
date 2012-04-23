class CreateHelpdeskTickets < ActiveRecord::Migration
  def change
    create_table :helpdesk_tickets do |t|
      t.string :subject
      t.text :description
      t.integer :requester_id
      t.integer :assignee_id
      t.string :status
      t.string :issue_type
      
      t.timestamps
    end
  end
end
