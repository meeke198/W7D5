class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :password_digest, null: false
      t.integer :session_token, null: false

      t.timestamps
    end
    add_index :users, [:username, :session_token], unique: true
    add_index :users, :password_digest 
  end
end
