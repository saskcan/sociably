class AddNotNullConstraintsToSubscriptions < ActiveRecord::Migration
  def change
  	change_column :subscriptions, :user_id, :integer, null: false
  	change_column :subscriptions, :task_id, :integer, null: false
  end
end
