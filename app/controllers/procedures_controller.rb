class ProceduresController < ApplicationController

  def index
    @procedure = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
    @procedure.work_instructions.build
  end

  def create
    @procedure = Procedure.create(procedure_params)
    if @procedure.save
      params[:procedure]['work_instruction_ids'].each do |work_instruction|
        if !work_instruction.empty?
          @procedure.procedure_work_instructions.create(:work_instruction_id => work_instruction)
        end
      end
    end
    valid_procedure
  end
end

private

def procedure_params
  params.require(:procedure).permit(:name, :work_instructions_attributes => [:name, :id] )
end

def valid_procedure
  if @procedure.valid?
    flash[:success] = 'Procedure has been saved!'
    redirect_to @procedure
  else
    render :new, :status => :unprocessable_entity
  end
end
