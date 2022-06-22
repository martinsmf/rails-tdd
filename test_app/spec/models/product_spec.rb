require "rails_helper"

RSpec.describe Product, type: :model do
  context "Product" do
    it "is valid with description, price and category" do
      product = create(:product)
      expect(product).to be_valid
    end
  end

  context "validate" do
    it "is invalid without description" do
      product = build(:product, description: nil)
      product.valid?
      #puts product.errors.inspect
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "is invalid without price" do
      product = build(:product, price: nil)
      product.valid?
      #puts product.errors.inspect
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without category" do
      product = build(:product, category: nil)
      product.valid?
      #puts product.errors.inspect
      expect(product.errors[:category]).to include("can't be blank")
    end
  end

  context "Instance Methods" do
    it "return a product  with a full description" do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end

  context "Associations" do
    it "#belongs_to", :smoke do
      product = build(:product)
      expect(product).to belong_to(:category)
    end
  end

  context "validates shoulda-matchers" do
    it { should validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:price) }
    it { should validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "Associations shoulda-matchers" do
    it { is_expected.to belong_to(:category) }
  end
end
