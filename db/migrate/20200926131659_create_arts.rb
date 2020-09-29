class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.string :title
      t.text :description
      t.string :rating
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
