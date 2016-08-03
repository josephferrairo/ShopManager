require 'rails_helper'

RSpec.describe PartsController, type: :controller do

  describe "get #new" do
    before(:each) do
      @customer = Fabricate(:customer)
    end
    it "returns a successful http request status code" do
      get :new, :customer_id => @customer
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before(:each) do
      @customer = Fabricate(:customer)
    end
    context "a successful create" do
      it "saves a new part object" do
        post :create, :customer_id => @customer,
        part: Fabricate.attributes_for(:part)
        expect(Part.count).to eq(1)
      end
    end
  end

end
