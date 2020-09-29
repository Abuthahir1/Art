class ChangeColumnDatatype < ActiveRecord::Migration[5.2]
  def change
  	change_column :arts, :rating, :integer
  end
end
