class PartsController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @part = Part.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @part = @customer.parts.create(part_params)
    redirect_to customer_path(@customer)
  end

  private
  def part_params
    params.require(:part).permit(:name, :description, :price, :procedure_id)
  end
end
