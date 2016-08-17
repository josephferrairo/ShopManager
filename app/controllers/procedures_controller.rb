class ProceduresController < ApplicationController
  before_action :find_procedure, except: [:index, :new, :create]

  def index
    @procedure = Procedure.all
  end

  def show
    find_procedure
  end

  def new
    @procedure = Procedure.new
    @procedure.work_instructions.build
  end

  def create
    @procedure = Procedure.create(procedure_params)
    if @procedure.save
      (params[:procedure]['work_instruction_ids'].to_a).each do |work_instruction|
        if !work_instruction.empty?
          @procedure.procedure_work_instructions.create(:work_instruction_id => work_instruction)
        end
      end
    end
    if @procedure.valid?
      flash[:success] = 'Procedure has been saved!'
      redirect_to @procedure
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    find_procedure
  end


  def update
    @procedure = Procedure.find(params[:id])
    @procedure.update_attributes!(procedure_params)
    if @procedure.save
      (params[:procedure]['work_instruction_ids'].to_a).each do |work_instruction|
        if !work_instruction.empty?
          @procedure.procedure_work_instructions.create(:work_instruction_id => work_instruction)
        end
      end
    end
    if @procedure.valid?
      flash[:success] = 'Procedure has been saved!'
      redirect_to @procedure
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    find_procedure
    @procedure.destroy
    flash[:error] = 'Procedure has been deleted!'
    redirect_to root_path
  end
end

private

def procedure_params
  params.require(:procedure).permit(:name, :procedurecode, [:work_instructions_attributes => [:name, :id]] )
end

def find_procedure
  @procedure = Procedure.find(params[:id])
end
