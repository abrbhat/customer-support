class AddAgentIdToSupportRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :support_requests, :customer_id, :integer, null: false
    add_column :support_requests, :agent_id, :integer, null: false
  end
end
