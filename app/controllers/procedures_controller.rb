class ProceduresController < ApplicationController

  def index
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
    @procedure.work_instructions.build
    #binding.pry
    #@work_instructions = WorkInstruction.all
    #  @procedure_work_instructions = ProcedureWorkInstruction.all
    # @all_work_instructions = WorkInstruction.all
    #@procedure.procedure_work_instructions.build
  end

  def create
    @procedure = Procedure.create(procedure_params)
    if @procedure.save


      #binding.pry
      params[:procedure]['work_instruction_ids'].each do |work_instruction|
        if !work_instruction.empty?
          @procedure.procedure_work_instructions.create(:work_instruction_id => work_instruction)
        end
      end
    end
    @work_instructions = WorkInstruction.all
    redirect_to root_path
  end
end

private

def procedure_params
  params.require(:procedure).permit(:name, :work_instructions_attributes => [:name, :id] )
end
