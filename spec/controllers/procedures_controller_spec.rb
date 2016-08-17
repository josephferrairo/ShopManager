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

  describe "POST #create" do
    context "a successful create" do
      it "saves a new procedure object" do

        post :create, procedure: Fabricate.attributes_for(:procedure)
        expect(Procedure.count).to eq(1)
      end
    end
  end

  describe "GET #edit" do
    let(:procedure) { Fabricate(:procedure) }
    it "sends a successful edit request" do
      get :edit, id: procedure

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successful update" do
      let(:abc) { Fabricate(:procedure, name: "ABC") }

      it "updates the modified procedure object" do
        put :update, procedure: Fabricate.attributes_for(:procedure, name: "XYZ"), id: abc.id

        expect(Procedure.last.name).to eq("XYZ")
        expect(Procedure.last.name).not_to eq("ABC")
      end
    end
  end

  describe "delete #destroy" do
    let(:procedure) { Fabricate(:procedure) }
    it "deletes the work instruction with the given id" do
      delete :destroy, id: procedure.id

      expect(Procedure.count).to eq(0)
    end
  end
end
