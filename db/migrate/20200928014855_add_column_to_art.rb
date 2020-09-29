class AddColumnToArt < ActiveRecord::Migration[5.1]
  def change
  	add_column :arts, :owner_by, :string
  end
end
