require "rails_helper"

RSpec.describe CustomersController, type: :controller do
  it "reponds successully" do
    get :index
    expect(response).to be_success
  end

  it "responds a 200 response" do
    expect(response).to have_http_status "200"
  end
end
