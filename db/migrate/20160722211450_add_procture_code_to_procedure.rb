class AddProctureCodeToProcedure < ActiveRecord::Migration[5.0]
  def change
    add_column :procedures, :procedurecode, :string
  end
end
