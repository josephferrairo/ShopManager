class PartsController < ApplicationController
before_action :find_part, except: [:index, :new, :create]

  def index
    @part = Part.all.includes(:procedure, :customer)
  end

  def show
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.create(part_params)
    if @part.save
      flash[:success] = 'New Part has been created!'
      redirect_to parts_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @part.update_attributes(part_params)
    if @part.save
      flash[:success] = 'Part has been updated!'
      redirect_to @part
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @part.destroy
    flash[:error] = 'Part has been deleted!'
    redirect_to parts_path
  end

  private
  def part_params
    params.require(:part).permit(:name, :description, :price, :procedure_id, :customer_id)
  end

  def find_part
    @part = Part.find(params[:id])
  end
end
