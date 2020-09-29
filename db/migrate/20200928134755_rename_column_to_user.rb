class RenameColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :owner_or_buyer, :category
  	change_column :users, :category, :integer
  end
end
