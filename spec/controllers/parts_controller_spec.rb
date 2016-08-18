require 'rails_helper'

RSpec.describe PartsController, type: :controller do

  describe "Get #index" do
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do
    it "returns a successful http request status code" do
      part = Fabricate(:part)

      get :show, id: part.id
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
      it "saves a new part object" do

        post :create, part: Fabricate.attributes_for(:part)
        expect(Part.count).to eq(1)
      end
    end
  end

  describe "Get #edit" do
    let(:part) { Fabricate(:part) }
    it "sends a successful edit request" do
      get :edit, id: part

      expect(response).to have_http_status(:success)
    end
  end

  describe "Put #update" do
    context "successful update" do
      let(:abc) { Fabricate(:part, name: "ABC") }
      it "updates the modified part object" do
        put :update, part:
        Fabricate.attributes_for(:part, name: "XYZ"), id: abc.id

        expect(Part.last.name).to eq("XYZ")
        expect(Part.last.name).not_to eq ("ABC")
      end
    end
  end

  describe "delete #destroy" do
    let(:part) { Fabricate(:part) }
    it "deletes the part with the given id" do
      delete :destroy, id: part.id

      expect(Part.count).to eq(0)
    end
  end

end
