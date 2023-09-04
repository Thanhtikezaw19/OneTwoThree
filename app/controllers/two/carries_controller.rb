class Two::CarriesController < ApplicationController
  def new
    @carry = Carry.new
    @carry.carry_2ds.build
  end

  def index
    @carries = Carry.all
    @carry = Carry.first
  end

  def show
    @carry = Carry.find(params[:id])
  end

  def create
    @carry = Carry.new(carry_params)
    @carry.user_id = 1

    if @carry.save
      redirect_to  two_index_path, notice: 'Carry was Created Successfully'
    else
      render :new
    end
  end

  private

    def carry_params
      permitted_params = params.require(:carry).permit(:name, :comission, :odds, carry_2ds_attributes: [:carry_2number, :carry_2amount])

      # Remove the empty carry_2ds_attributes before returning
      permitted_params[:carry_2ds_attributes].reject! { |attr| attr[:carry_2number].blank? && attr[:carry_2amount].blank? }

      permitted_params
    end

end
