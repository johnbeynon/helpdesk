class CreateHelpdeskSubscribers < ActiveRecord::Migration
  def change
    create_table :helpdesk_subscribers do |t|
      t.string :name
      t.string :email
      t.string :lang
      t.string :hashcode
      t.boolean :confirmed,:default=>0,:null=>false
      
      t.timestamps
    end
  end
end
