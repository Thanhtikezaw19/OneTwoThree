class Customer < ApplicationRecord
  has_many :bet_2ds, dependent: :destroy, class_name: 'Bet2ds'

  accepts_nested_attributes_for :bet_2ds

  after_create :add_data_to_primary_table

  private

    def add_data_to_primary_table
      today = Date.today

      bet_2ds.each do |bet_2d|
        two_number = TwoNumber.find_by(numbers: bet_2d.twod_number)

        if two_number && (two_number.created_at.to_date == today || two_number.updated_at.to_date == today)
          two_number.update(amount: two_number.amount + bet_2d.twod_amount)
        elsif two_number
          two_number.update(amount: bet_2d.twod_amount)
        end
      end
    end
end
