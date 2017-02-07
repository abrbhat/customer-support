class RemoveNotNullFromAgentIdOnSupportRequests < ActiveRecord::Migration[5.0]
  def change
    change_column_null :support_requests, :agent_id, true
  end
end
