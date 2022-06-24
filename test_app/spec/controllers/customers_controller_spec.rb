require "rails_helper"

RSpec.describe CustomersController, type: :controller do
  describe "as a Guest", :index do
    context "#index" do
      it "reponds successully" do
        get :index
        expect(response).to be_successful
      end

      it "responds a 200 response" do
        get :index
        expect(response).to have_http_status "200"
      end

      it { should route(:get, "/customers").to(action: :index) }
    end

    it "responds a 302 response (not authorized)" do
      create(:customer)
      get :show, params: { id: Customer.first.id }
      expect(response).to have_http_status(302)
    end
  end

  describe "as logged Member" do
    before(:all) do
      @member = create(:member)
      @customer = create(:customer)
    end

    it "with valid attributes", :attr_for do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it "with valid attributes", :attr_for do
      customer_params = attributes_for(:customer, address: nil)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.not_to change(Customer, :count)
    end

    it "flash Noticie", :notice do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      p response
      expect(flash[:notice]).to eq("Customer was successfully created.")
    end

    it "Content-Type", :ct do
      sign_in @member
      get :show, format: :json, params: { id: @customer.id }
      p response
      expect(response.content_type).to eq("application/json")
    end

    it "#show" do
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it "render a :show template" do
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
