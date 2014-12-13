class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.string :title
      t.integer :number
      t.integer :start_page
      t.text :description

      t.timestamps
    end
  end
end
