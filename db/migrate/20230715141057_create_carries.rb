class CreateCarries < ActiveRecord::Migration[7.0]
  def up
    create_table :carries do |t|
      t.string :name, null: false
      t.integer :comission, null: false
      t.integer :odds, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_foreign_key :carries, :users, column: :user_id, on_delete: :cascade
  end

  def down
    drop_table :carries
  end
end
