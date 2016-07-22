require 'rails_helper'

RSpec.describe ProceduresController, type: :controller do

  describe "Get #index" do
    it "returns a succcessful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do
    it "returns a successful http request status code" do
      procedure = Fabricate(:procedure)

      get :show, id: procedure.id
      expect(response).to have_http_status(:success)
    end
  end

  #describe "POST #create" do
  #  context "a successful create" do
  #    it "saves a new procedure object" do

  #      post :create, procedure: Fabricate.attributes_for(:procedure)
  #      expect(Procedure.count).to eq(1)
  #    end
  #  end
  #end
end
