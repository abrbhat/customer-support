class AddIndexToSupportRequest < ActiveRecord::Migration[5.0]
  def change
    add_index :support_requests, :customer_id
    add_index :support_requests, :agent_id
  end
end
