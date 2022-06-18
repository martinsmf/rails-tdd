require "rails_helper"

RSpec.describe Order, type: :model do
  it "belongs_to" do
    order = create(:order)
    puts order.inspect
    expect(order.customer).to be_kind_of(Customer)
  end

  it "Possui 3 pedidos - create_list" do
    orders = create_list(:order, 3)
    puts orders.inspect
    expect(orders.count).to eq(3)
  end

  it "has_many", :many do
    customer = create(:customer, :with_orders)
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end
end
