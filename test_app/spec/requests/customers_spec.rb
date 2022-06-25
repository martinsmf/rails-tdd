require "rails_helper"

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "does something" do
      get "/customers/1.json"
      expect(response).to match_response_schema("customer")
    end

    it "works! (now write some real specs)" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it " index - Json 200 ok" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: 1,
        name: "Jong Cartwright",
        email: "meu_email-1@email.com",
      ])
    end

    it " index - Json 200 ok" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String),
      ])
    end

    it " show - Json 200 ok" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String),
      )
    end

    it "show - RSpec puro + JSON" do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
      expect(response_body.fetch("email")).to be_kind_of(String)
    end

    it "create - json" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }
      customers_params = attributes_for(:customer)
      p customers_params
      post "/customers.json", params: { customer: customers_params }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customers_params.fetch(:name),
        email: customers_params.fetch(:email),
      )
    end

    it "create - json" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }
      customers = Customer.first

      customers.name += " - Atualizado"
      p customers

      patch "/customers/#{customers.id}.json", params: { customer: customers.attributes }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customers.name,
        email: customers.email,
      )
    end

    it "destroy - json" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }
      customers = Customer.first

      customers.name += " - Atualizado"
      p customers

      expect {
        delete "/customers/#{customers.id}.json",
               params: { customer: customers.attributes },
               headers: headers
      }.to change(Customer, :count).by(-1)

      expect(response).to have_http_status(204)
    end
  end
end
