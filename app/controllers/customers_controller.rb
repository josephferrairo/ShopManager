class CustomersController < ApplicationController
  before_action :find_customer, except: [:index, :new, :create]

  def index
    @customers = Customer.all
  end

  def show
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
  end

  def update
    @customer.update_attributes(customer_params)
    if @customer.save
      flash[:success] = 'Customer has been saved!'
      redirect_to @customer
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    flash[:error] = 'Customer has been deleted!'
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name,  :customercode, :address, :addressdetails, :city, :state, :zipcode)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
