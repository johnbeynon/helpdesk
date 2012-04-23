class CreateHelpdeskComments < ActiveRecord::Migration
  def change
    create_table :helpdesk_comments do |t|
      t.integer :ticket_id
      t.text :comment
      t.integer :author_id
      t.boolean :public

      t.timestamps
    end
  end
end
