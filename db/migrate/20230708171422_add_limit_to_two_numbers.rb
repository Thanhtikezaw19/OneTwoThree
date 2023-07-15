class AddLimitToTwoNumbers < ActiveRecord::Migration[7.0]
  def up
    add_column :two_numbers, :limit, :integer
  end

  def down
    remove_column :two_numbers, :limit, :integer
  end
end
