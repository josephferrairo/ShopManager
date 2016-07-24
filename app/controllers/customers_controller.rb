class CustomersController < ApplicationController

  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.save
      flash[:success] = 'Customer has been saved!'
    else
      render :new, :status => :unprocessable_entity
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name,  :customercode, :address, :addressdetails, :city, :state, :zipcode)
  end
end
