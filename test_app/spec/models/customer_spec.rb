require "rails_helper"

RSpec.describe Customer, type: :model do
  # fixtures :customers

  # it "Create a Customer" do
  #   subject.name = "Matheus"
  #   subject.email = "matheus@matheus.com"
  #   subject.save
  #   expect(subject.full_name).to eq("Mr. Matheus")
  # end

  # it "Create a Customer useing fixtures" do
  #   customer = customers(:matheus)
  #   expect(customer.full_name).to eq("Mr. Matheus Development")
  # end

  it "#full_name" do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Mr. ")
  end

  it "#full_name - overwriting attribute " do
    customer = build(:customer, name: "Matheus")
    customer1 = build(:customer, name: "Matheus")
    puts customer.email
    puts customer1.email
    expect(customer.full_name).to eq("Mr. Matheus")
  end

  it "#full_name - overwriting attribute " do
    customer = build(:customer, vip: false, days_to_pay: 10)
    expect(customer.vip).to eq(false)
  end

  it "#customer_vip" do
    customer = build(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it "Usando o attributes_for", :attrs do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Mr. ")
  end

  it "Create a customer useing factories" do
    subject = build(:zoro)
    expect(subject.full_name).to start_with("Mr. ")
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it "Atributo Transitório", :a do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it "Cliente Masculino vip", :trait do
    customer = create(:customer_male_vip)
    expect(customer).to have_attributes(vip: eq(true), gender: eq("M"))
  end

  it "Cliente Masculino", :trait do
    customer = create(:customer_male)
    expect(customer.gender).to eq("M")
  end

  it "Cliente feminino default", :trait do
    customer = create(:customer_female_default)
    expect(customer).to have_attributes(vip: eq(false), gender: eq("F"))
  end

  it "Cliente Feminino", :trait do
    customer = create(:customer_female)
    expect(customer.gender).to eq("F")
  end
end
