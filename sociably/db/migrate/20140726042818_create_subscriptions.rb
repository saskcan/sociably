class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user
      t.integer :task
      t.decimal :progress

      t.timestamps
    end
  end
end
