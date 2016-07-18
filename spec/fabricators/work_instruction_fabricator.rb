Fabricator(:work_instruction) do
  name        { Faker::Company.name }
  workcode    { Faker::Hacker.abbreviation }
  description { Faker::Lorem.sentence }
end
