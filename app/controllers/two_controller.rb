class TwoController < ApplicationController
  def index
    @customer = Customer.new
    @customer.bet_2ds.build
  end

  def update_table
    respond_to do |format|
      format.html { render partial: 'table_partial', locals: { data: @data } } # Render a partial containing the table HTML
    end
  end
end
