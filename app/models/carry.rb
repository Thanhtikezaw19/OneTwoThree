class Carry < ApplicationRecord
  has_many :carry_2ds, dependent: :destroy, class_name: 'Carry2ds'

  accepts_nested_attributes_for :carry_2ds

  after_create :sub_data_from_primary_table

  private

    def sub_data_from_primary_table
      today = Date.today

      carry_2ds.each do |carry_2d|
        two_number = TwoNumber.find_by(numbers: carry_2d.carry_2number)

        if two_number && (two_number.created_at.to_date == today || two_number.updated_at.to_date == today)
          two_number.update(amount: two_number.amount - carry_2d.carry_2amount)
        elsif two_number
          two_number.update(amount: carry_2d.carry_2amount)
        end
      end
    end
end
