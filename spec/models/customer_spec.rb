require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:customercode) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_length_of(:state).is_equal_to(2) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_length_of(:zipcode).is_equal_to(5) }

end
