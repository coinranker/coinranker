class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :password_digest
      t.text :exchanges

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :nickname, unique: true
  end
end
