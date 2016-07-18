class AddColumnsToWorkInstructionsAndProcedures < ActiveRecord::Migration[5.0]
  def change
    add_column :work_instructions, :workcode, :string
    add_column :work_instructions, :description, :text
  end
end
