class CreateHelpdeskTicketTypes < ActiveRecord::Migration
  def up
    create_table :helpdesk_ticket_types do |t|
      t.integer :position
      t.boolean :active,:default=>1,:null=>false

      t.timestamps
    end
    Helpdesk::TicketType.create_translation_table! :title => :string
  end

  def down
    drop_table :helpdesk_ticket_types
    Helpdesk::TicketType.drop_translation_table!
  end
end
