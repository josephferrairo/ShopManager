class CreateProcedureWorkInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :procedure_work_instructions do |t|
      t.integer :procedure_id, :null => false
      t.integer :work_instruction_id, :null => false

      t.timestamps
    end
  end
end
