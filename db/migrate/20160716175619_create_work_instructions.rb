class CreateWorkInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :work_instructions do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
