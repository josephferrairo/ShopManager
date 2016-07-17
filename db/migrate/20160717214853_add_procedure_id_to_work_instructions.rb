class AddProcedureIdToWorkInstructions < ActiveRecord::Migration[5.0]
  def change
    add_column :work_instructions, :procedure_id, :integer
  end
end
