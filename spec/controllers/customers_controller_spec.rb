require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "get #show" do
    it "returns a successfull http request status code" do
      customer = Fabricate(:customer)

      get :show, id: customer.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "get #new" do

    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "a successful create" do
      it "saves the new customer object" do

        post :create, customer: Fabricate.attributes_for(:customer)
        expect(Customer.count).to eq(1)
      end
    end
  end

  describe "Put #update" do

    context "successful update" do
      let(:abc) { Fabricate(:customer, name: "ABC")}

      it "updates the modified customer object" do
        put :update, customer: Fabricate.attributes_for(:customer, name: "XYZ"), id: abc.id

        expect(Customer.last.name).to eq("XYZ")
        expect(Customer.last.name).not_to eq("ABC")
      end
    end
  end

  describe "GET #edit" do
    let(:customer) { Fabricate(:customer) }

    it "sends a successful edit request" do
      get :edit, id: customer

      expect(response).to have_http_status(:success)
    end
  end

  describe "delete #destroy" do
    let(:customer) { Fabricate(:customer)}

    it "deletes the customer with the given id" do
      delete :destroy, id: customer.id

      expect(Customer.count).to eq(0)
    end
  end
end
