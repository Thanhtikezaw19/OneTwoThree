class TwoNumbers < ActiveRecord::Migration[7.0]
  def up
    create_table :two_numbers do |t|
      t.string :numbers
      t.integer :amount, null: false, default: 0
    end
  end
  def down
    drop_table :two_numbers
  end
end
