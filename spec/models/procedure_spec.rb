require 'rails_helper'

RSpec.describe Procedure, type: :model do
  it { should have_many(:work_instructions) }
  it { should have_many(:procedure_work_instructions) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:procedurecode) }
  it { should validate_length_of(:procedurecode).is_at_most(4) }
end
