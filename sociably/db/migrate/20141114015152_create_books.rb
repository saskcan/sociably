class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.integer :publisher_id
      t.string :edition
      t.date :publish_date
      t.string :title

      t.timestamps
    end
  end
end
