class RemoveProgressFromTasks < ActiveRecord::Migration
  def change
  	remove_column :tasks, :progress
  end
end
