require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "all 4 fields save" do      
      category = Category.new 
      product = Product.new 
      product.name = "Product 1"
      product.price = 1050
      product.quantity = 10
      product.category = category      
      expect(product).to be_valid
    end

    it "Name equals nil" do       
      category = Category.new 
      product = Product.new 
      product.name = nil
      product.price = 1050
      product.quantity = 10
      product.category = category

      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eql(["Name can't be blank"])
    end

    it "Price equals nil" do       
      category = Category.new 
      product = Product.new 
      product.name = "Everdell"
      product.price = nil
      product.quantity = 10
      product.category = category
      
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end   
    
    it "Quantity equals nil" do       
      category = Category.new 
      product = Product.new 
      product.name = "Everdell"
      product.price = 1050
      product.quantity = nil
      product.category = category
      
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eql(["Quantity can't be blank"])
    end    

    it "Category equals nil" do       
      category = Category.new 
      product = Product.new 
      product.name = "Everdell"
      product.price = 1050
      product.quantity = 10
      product.category = nil
      
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eql(["Category can't be blank"])
    end   

  end
end
