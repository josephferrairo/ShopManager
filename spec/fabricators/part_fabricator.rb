Fabricator(:part) do
  customer
  name          { Faker::Company.name }
  description   { Faker::Lorem.word }
  price         { Faker::Number.decimal(2) }
  procedure

end
