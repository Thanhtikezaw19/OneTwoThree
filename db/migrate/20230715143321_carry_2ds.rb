class Carry2ds < ActiveRecord::Migration[7.0]
  def up
    create_table :carry2ds do |t|
      t.string :carry_2number
      t.integer :carry_2amount, null: false, default: 0
      t.references :carry, null: false, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :carry2ds
  end
end
