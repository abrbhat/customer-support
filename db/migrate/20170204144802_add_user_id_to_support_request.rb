class AddUserIdToSupportRequest < ActiveRecord::Migration[5.0]
  def change
    add_reference :support_requests, :user, foreign_key: true
  end
end
