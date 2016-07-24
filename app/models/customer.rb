class Customer < ApplicationRecord
  validates :name, :customercode, :address, :city, :state, :zipcode, presence: true
  validates :state, length: { is: 2 }
  validates :zipcode, presence: true, length: { is: 5 }
end
