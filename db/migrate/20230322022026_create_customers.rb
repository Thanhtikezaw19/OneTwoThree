class CreateCustomers < ActiveRecord::Migration[7.0]
  def up
    create_table :customers do |t|
      t.string :name, null: false
      t.integer :comission, null: false
      t.integer :odds, null: false
      t.integer :numbers, null: false
      t.integer :amount, null: false
      t.integer :total_amount, null: true
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_foreign_key :customers, :users, column: :user_id, on_delete: :cascade
  end

  def down
    drop_table :customers
  end
end
