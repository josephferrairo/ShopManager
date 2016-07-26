require 'rails_helper'

RSpec.describe Part, type: :model do
  it { should belong_to(:customer) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }


end
