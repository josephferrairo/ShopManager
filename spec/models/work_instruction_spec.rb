require 'rails_helper'

RSpec.describe WorkInstruction, type: :model do
  it { should have_many(:procedures) }
  it { should have_many(:procedure_work_instructions) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:workcode) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:workcode).is_at_most(4) }

end
