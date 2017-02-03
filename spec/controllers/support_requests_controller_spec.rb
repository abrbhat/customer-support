require 'rails_helper'

RSpec.describe SupportRequestsController, type: :controller do
  render_views

  describe "GET #index" do
    it "should return a list of support_requests" do
      create(:support_request)

      get :index, params: {}

      expect(response).to have_http_status(:ok)
      expect(json["support_requests"]).to be_present
      expect(json["support_requests"].length).to be 1
    end
  end

  describe "GET #show" do
    it "assigns the requested support_request as @support_request" do
      support_request = SupportRequest.create! valid_attributes
      get :show, params: {id: support_request.to_param}

      expect(response).to have_http_status(:ok)

    end
  end

  describe "GET #new" do
    it "assigns a new support_request as @support_request" do
      get :new, params: {}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SupportRequest" do
        expect {
          post :create, params: {support_request: valid_attributes}
        }.to change(SupportRequest, :count).by(1)
      end

      it "assigns a newly created support_request as @support_request" do
        post :create, params: {support_request: valid_attributes}
        expect(response).to have_http_status(:created)
      end

      it "redirects to the created support_request" do
        post :create, params: {support_request: valid_attributes}
        expect(response).to redirect_to(SupportRequest.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved support_request as @support_request" do
        post :create, params: {support_request: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested support_request" do
        support_request = SupportRequest.create! valid_attributes
        put :update, params: {id: support_request.to_param, support_request: new_attributes}
        support_request.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested support_request as @support_request" do
        support_request = SupportRequest.create! valid_attributes
        put :update, params: {id: support_request.to_param, support_request: valid_attributes}
        expect(assigns(:support_request)).to eq(support_request)
      end

      it "redirects to the support_request" do
        support_request = SupportRequest.create! valid_attributes
        put :update, params: {id: support_request.to_param, support_request: valid_attributes}
        expect(response).to redirect_to(support_request)
      end
    end

    context "with invalid params" do
      it "assigns the support_request as @support_request" do
        support_request = SupportRequest.create! valid_attributes
        put :update, params: {id: support_request.to_param, support_request: invalid_attributes}
        expect(assigns(:support_request)).to eq(support_request)
      end

      it "re-renders the 'edit' template" do
        support_request = SupportRequest.create! valid_attributes
        put :update, params: {id: support_request.to_param, support_request: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested support_request" do
      support_request = SupportRequest.create! valid_attributes
      expect {
        delete :destroy, params: {id: support_request.to_param}
      }.to change(SupportRequest, :count).by(-1)
    end

    it "redirects to the support_requests list" do
      support_request = SupportRequest.create! valid_attributes
      delete :destroy, params: {id: support_request.to_param}
      expect(response).to redirect_to(support_requests_url)
    end
  end

end
