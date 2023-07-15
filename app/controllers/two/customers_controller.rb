class Two::CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @customer.bet_2ds.build
  end

  def index
    @customers = Customer.all
    @customer = Customer.first
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    puts params.inspect
    @customer = Customer.new(customer_params)
    @customer.user_id = 1

    if @customer.save
      # redirect_to @customer, notice: 'Customer was successfully created.'
      redirect_to  two_index_path, notice: 'Customer Created Successfully'
    else
      render :new
    end
  end

  def update_all_limits
    limit = params[:limit]
    TwoNumber.update_all(limit: limit)
    redirect_to two_index_path, notice: 'Limits updated successfully.'
  end

  private

    def customer_params
      permitted_params = params.require(:customer).permit(:name, :comission, :odds, bet_2ds_attributes: [:id, :twod_number, :twod_amount])

      # Remove the empty bet_2ds_attributes before returning
      permitted_params[:bet_2ds_attributes].reject! { |attr| attr[:twod_number].blank? && attr[:twod_amount].blank? }

      permitted_params
    end

end
