require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  before(:each) do
    @customer = Fabricate(:customer)
    @part = Fabricate(:part, customer: @customer)
    @part_attributes = Fabricate.attributes_for(:part)
  end

  describe "get #new" do
    it "returns a successful http request status code" do
      get :new, customer_id: @customer
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves a new part object" do
        expect { post :create, customer_id: @customer, part: @part_attributes }.to change( Part, :count).by(1)
      end
    end
  end

  describe '#DELETE destroy' do
    it 'destroys the requested part' do
      expect { delete :destroy, { customer_id:  @customer, id: @part.id } }.to change(Part, :count).by(-1)
    end
  end

  describe 'Get #edit' do
    let(:part) { @part }
    it 'sends a successful edit request' do
      get :edit, id: @part, customer_id: @customer
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    context "successful update" do
      let(:abc) { Fabricate(:part, customer: @customer, name: 'abc') }
      it 'updates the modified part object' do
        put :update, customer_id: @customer, part: Fabricate.attributes_for(:part, name: 'xyz'), id: abc.id
        expect(Part.last.name).to eq('xyz')
        expect(Part.last.name).not_to eq('abc')
      end
    end
  end
end
