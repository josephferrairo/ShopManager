class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :customercode
      t.string :address
      t.string :addressdetails
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
