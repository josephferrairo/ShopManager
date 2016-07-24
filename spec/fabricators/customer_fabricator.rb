Fabricator(:customer) do
  name            { Faker::Company.name }
  customercode    { Faker::Hacker.abbreviation }
  address         { Faker::Address.street_address }
  addressdetails  { Faker::Address.secondary_address}
  city            { Faker::Address.city_suffix }
  state           { Faker::Address.state_abbr }
  zipcode         { Faker::Number.number(5) }
end
