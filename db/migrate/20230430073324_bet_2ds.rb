class Bet2ds < ActiveRecord::Migration[7.0]
  def up
    create_table :bet2ds do |t|
      t.string :twod_number
      t.integer :twod_amount, null: false, default: 0
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
