# This migration comes from helpdesk (originally 20130522090420)
class CreateHelpdeskSubscribers < ActiveRecord::Migration
  def change
    create_table :helpdesk_subscribers do |t|
      t.string :name
      t.string :email
      t.string :lang
      t.string :hashcode
      t.boolean :confirmed,:default=>false,:null=>false

      t.timestamps
    end
  end
end
