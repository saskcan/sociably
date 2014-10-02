class FixColumnNames < ActiveRecord::Migration
  def change
  	rename_column :subscriptions, :user, :user_id
  	rename_column :subscriptions, :task, :task_id
  end
end
