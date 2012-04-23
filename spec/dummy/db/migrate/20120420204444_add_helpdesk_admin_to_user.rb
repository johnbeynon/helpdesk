class AddHelpdeskAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :helpdesk_admin, :boolean
  end
end
