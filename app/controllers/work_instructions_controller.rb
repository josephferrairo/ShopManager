class WorkInstructionsController < ApplicationController
  before_action :find_work_instruction, except: [:index, :new, :create]

  def index
    @work_instruction = WorkInstruction.all
  end

  def show
  end

  def new
    @work_instruction = WorkInstruction.new
  end

  def create
    @work_instruction = WorkInstruction.create(work_instruction_params)
    if @work_instruction.save
      flash[:success] = 'Instructions have been saved!'
      redirect_to work_instructions_path
    else
      render :new, :status => :unprocessable_entity
    end
  end
end

def edit
end

def update
  @work_instruction.update_attributes(work_instruction_params)
  if @work_instruction.save
    flash[:success] = 'Instructions have been saved!'
    redirect_to work_instructions_path
  else
    render :edit, :status => :unprocessable_entity
  end
end


def destroy
  @work_instruction.destroy
  redirect_to root_path
end


private

def work_instruction_params
  params.require(:work_instruction).permit(:name, :workcode, :description)
end

def find_work_instruction
  @work_instruction = WorkInstruction.find(params[:id])
end
