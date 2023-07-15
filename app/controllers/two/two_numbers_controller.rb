class Two::TwoNumbersController < ApplicationController
  def show
    @two_numbers = TwoNumber.all
    render partial: "table", locals: { two_numbers: @two_numbers }
  end

  def update_all_limits
    limit = params[:limit]
    TwoNumber.update_all(limit: limit)
    # Additional code as needed
  end
end
