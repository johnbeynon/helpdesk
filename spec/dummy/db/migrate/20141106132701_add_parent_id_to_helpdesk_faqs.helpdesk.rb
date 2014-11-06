# This migration comes from helpdesk (originally 20141105112734)
class AddParentIdToHelpdeskFaqs < ActiveRecord::Migration
  def change
    add_column :helpdesk_faqs, :parent_id, :integer
    add_column :helpdesk_faqs, :depth, :integer, null:false, default:0
    add_column :helpdesk_faqs, :children_count, :integer, null:false, default:0
    add_index :helpdesk_faqs, :parent_id
  end
end
