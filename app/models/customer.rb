class Customer < ApplicationRecord
  validates :name, :custuomercode, :address, :city, :state, :zipcode, presence: true
  validates :state, length: { is: 2 }
  validates :zipcode, presence: true, length: { is: 5 }
end
