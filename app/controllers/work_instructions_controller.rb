class WorkInstructionsController < ApplicationController

  def index
    @work_instruction = WorkInstruction.all
  end

  def show
    @work_instruction = WorkInstruction.find(params[:id])
  end

  def new
    @work_instruction = WorkInstruction.new
  end

  def create
    @work_instruction = WorkInstruction.create(work_instruction_params)
    if @work_instruction.save
      flash[:success] = 'New instructions have been created!'
      redirect_to work_instructions_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @work_instruction = WorkInstruction.find(params[:id])
  end

  def update
    @work_instruction = WorkInstruction.find(params[:id])
    @work_instruction.update_attributes(work_instruction_params)
    if @work_instruction.valid?
      redirect_to root_path
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @work_instruction = WorkInstruction.find(params[:id])
    @work_instruction.destroy
    redirect_to root_path
  end


  private

  def work_instruction_params
    params.require(:work_instruction).permit(:name, :workcode, :description)
  end

end
