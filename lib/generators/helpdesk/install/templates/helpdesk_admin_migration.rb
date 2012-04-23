class AddHelpdeskAdmin < ActiveRecord::Migration

  def change
    add_column <%= user_class.constantize.table_name.to_sym.inspect %>, :helpdesk_admin, :boolean, :default => false
  end

end
