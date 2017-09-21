class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :exchange, limit: 30

      t.timestamps
    end
  end
end
