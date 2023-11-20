require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "some_categoty")
  end

  describe 'Validations' do
    it "Should save a product with all four fields set" do
      @product = Product.create(name: "Some plant", description: "green", price: 600, quantity: 2, category: @category)
      expect(@product).to be_valid
    end

    it "Should not save a product with the name absent" do
      @product = Product.create(description: "green", price: 600, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it "Should not save a product with the quantity absent" do
      @product = Product.create(name: "plant", price: 600, category: @category)
      expect(@product).to_not be_valid
    end

    it "Should not save a product with the price absent" do
      @product = Product.create(name: "plant", quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it "Should not save a product with the category absent" do
      @product = Product.create(name: "plant", price: 600, quantity: 2)
      expect(@product).to_not be_valid
    end
  end
end
