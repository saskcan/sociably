class RenameContribututors < ActiveRecord::Migration
  def change
  	rename_table :contributors, :contributions
  end
end
