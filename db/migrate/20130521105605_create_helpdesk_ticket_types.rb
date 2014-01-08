class CreateHelpdeskTicketTypes < ActiveRecord::Migration
  def up
    create_table :helpdesk_ticket_types do |t|
      t.integer :position
      t.boolean :active,:default=>1,:null=>false
      t.string :tr_class
      t.timestamps
    end
    Helpdesk::TicketType.create_translation_table! :title => :string


    tt = [["Sugestia","Sugestion","warning"],
          ["Pochwała","Appreciation","success"],
          ["Błąd","Complaint","error"],
          ["Pytanie","Enquiry","info"],
          ["Kontakt","Contact","contact"]]

    tt.each do |item|
      I18n.locale = :pl
      type = Helpdesk::TicketType.new
      type.title = item[0]
      I18n.locale = :en
      type.title = item[1]
      type.tr_class = item[2]
      type.active = true
      type.save!
    end

  end

  def down
    drop_table :helpdesk_ticket_types
    Helpdesk::TicketType.drop_translation_table!
  end
end
