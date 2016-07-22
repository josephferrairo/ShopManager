Fabricator(:procedure) do
  name           { Faker::Company.name }
  procedurecode { Faker::Hacker.abbreviation }
end
