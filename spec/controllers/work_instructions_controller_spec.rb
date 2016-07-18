require 'rails_helper'

RSpec.describe WorkInstructionsController, type: :controller do

  describe "Get #index" do
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do
    it "returns a successful http request status code" do
      work_instruction = Fabricate(:work_instruction)

      get :show, id: work_instruction.id
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
      it "saves a new work instruction object" do

        post :create, work_instruction: Fabricate.attributes_for(:work_instruction)
        expect(WorkInstruction.count).to eq(1)
      end
    end
  end

  describe "Put #update" do

    context "successful update" do
      let(:abc) { Fabricate(:work_instruction, name: "ABC") }
      it "updates the modified work instruction object" do
        put :update, work_instruction: Fabricate.attributes_for(:work_instruction, name: "XYZ"), id: abc.id

        expect(WorkInstruction.last.name).to eq("XYZ")
        expect(WorkInstruction.last.name).not_to eq("ABC")
      end
    end
  end

  describe "GET #edit" do
    let(:work_instruction) { Fabricate(:work_instruction) }
    it "sends a successful edit request" do
      get :edit, id: work_instruction

      expect(response).to have_http_status(:success)
    end
  end

  describe "delete #destroy" do
    let(:work_instruction) { Fabricate(:work_instruction) }
    it "deletes the work instruction with the given id" do
      delete :destroy, id: work_instruction.id

      expect(WorkInstruction.count).to eq(0)
    end
  end

end
