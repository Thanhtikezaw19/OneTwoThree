class Two::CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @customer.bet_2ds.build
  end

  def create
    puts params.inspect
    @customer = Customer.new(customer_params)
    @customer.user_id = 1

    if @customer.save
      # redirect_to @customer, notice: 'Customer was successfully created.'
      redirect_to  two_index_path
    else
      render :new
    end
  end

  private

    def customer_params
      permitted_params = params.require(:customer).permit(:name, :comission, :odds, bet_2ds_attributes: [:id, :twod_number, :twod_amount])

      # Remove the empty bet_2ds_attributes before returning
      permitted_params[:bet_2ds_attributes].reject! { |attr| attr[:twod_number].blank? && attr[:twod_amount].blank? }

      permitted_params
    end

end
