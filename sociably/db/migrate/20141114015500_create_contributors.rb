class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :person_id
      t.integer :role_id
      t.integer :contributable_id
      t.string :contributable_type

      t.timestamps
    end
  end
end
