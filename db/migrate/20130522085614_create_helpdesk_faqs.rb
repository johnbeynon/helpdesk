class CreateHelpdeskFaqs < ActiveRecord::Migration
  def up
    create_table :helpdesk_faqs do |t|
      t.integer :position
      t.boolean :active,:default=>0,:null=>false

      t.timestamps
    end
    Helpdesk::Faq.create_translation_table! :title => :string, :text => :text
  end

  def down
    drop_table :helpdesk_faqs
    Helpdesk::Faq.drop_translation_table!
  end

end
