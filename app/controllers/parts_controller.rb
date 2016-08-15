class PartsController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @part = Part.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @part = @customer.parts.create(part_params)
    if @part.save
      flash[:success] = 'New Part has been created!'
      redirect_to customer_path(@customer)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @part = @customer.parts.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @part = @customer.parts.find(params[:id])
    @part.update_attributes(part_params)
    if @part.save
      flash[:success] = 'Part has been updated'
      redirect_to customers_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @part = @customer.parts.find(params[:id])
    @part.destroy
    flash[:error] = 'Part has been deleted!'
    redirect_to customers_path
  end

  private
  def part_params
    params.require(:part).permit(:name, :description, :price, :procedure_id)
  end
end
