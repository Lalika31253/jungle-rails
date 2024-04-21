require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "my_category")
  end

  describe 'Validations' do
     #validates :name, presence: true
     it "is not valid without the name" do
      product = Product.new(name: nil, description: "The Xanthosoma Magnificum is a remarkable indoor plant with large variegated leaves", price: 45, quantity: 70, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    #validates :price, presence: true
    it "is not valid without the price" do
      product = Product.new(name: "Spathiphyllum", description: "Spathiphyllum is a genus of herbaceous evergreen plants with dark green foliage", quantity: 9, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    #validates :quantity, presence: true
    it "is not valid without the quantity" do
      @product = Product.new(name: "Orchid", description: "The Xanthosoma Magnificum is a remarkable indoor plant with large variegated leaves", price: 60, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    #validates :category, presence: true
    it "is not valid without the category" do
      @product = Product.new(name: "Costa Nursery", description: "Tropical landscape majesty Palm", price: 24, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
