class TwoNumbersController < ApplicationController
  def show
    @two_numbers = TwoNumber.all
    render partial: "table", locals: { two_numbers: @two_numbers }
  end
end
