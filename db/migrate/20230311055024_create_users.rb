class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.integer :phone_number, null: false
      t.string :password_digest

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
