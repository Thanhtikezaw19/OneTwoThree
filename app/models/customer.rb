class Customer < ApplicationRecord
  has_many :bet_2ds, dependent: :destroy, class_name: 'Bet2ds'

  accepts_nested_attributes_for :bet_2ds
end
