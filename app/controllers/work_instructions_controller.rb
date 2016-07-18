class WorkInstructionsController < ApplicationController

  def index
  end

  def new
    @work_instruction = WorkInstruction.new
  end

  def create
    WorkInstruction.create(work_instruction_params)
    redirect_to root_path
  end

private

  def work_instruction_params
    params.require(:work_instruction).permit(:name, :workcode, :description)
  end

end
