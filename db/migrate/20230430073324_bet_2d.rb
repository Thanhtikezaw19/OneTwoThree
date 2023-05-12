class Bet2d < ActiveRecord::Migration[7.0]
  def up
    create_table :bet_2d do |t|
      t.string :twod_number
      t.integer :twod_amount, null: false, default: 0
      t.bigint :customer_id, null: false
      t.timestamps
    end
    add_foreign_key :bet_2d, :customers, column: :customer_id, on_delete: :cascade
  end
end
