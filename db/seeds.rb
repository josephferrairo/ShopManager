task :sample_data => :environment do
  require 'faker'
end

def create_customer
  20.times do |n|
    name = Faker::Company.name
    customercode = ([*('A'..'Z'),*('0'..'9')].sample(4).join)
    address = Faker::Address.city
    addressdetails = Faker::Address.secondary_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr
    zipcode = Faker::Number.number(5)
    Customer.create!(
    name: name,
    customercode: customercode,
    address: address,
    addressdetails: addressdetails,
    city: city,
    state: state,
    zipcode: zipcode
    )
  end
end

create_customer
