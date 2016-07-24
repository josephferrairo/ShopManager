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
      redirect_to @customer
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    if @customer.save
      flash[:success] = 'Customer has been saved!'
      redirect_to @customer
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:error] = 'Customer has been deleted!'
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name,  :customercode, :address, :addressdetails, :city, :state, :zipcode)
  end
end
