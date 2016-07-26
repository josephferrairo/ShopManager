class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.decimal :price
      
      t.integer :procedure_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
