class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :login_token
      t.datetime :login_token_valid_until
      t.string :type

      t.timestamps
    end
  end
end
