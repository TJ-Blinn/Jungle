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
  end
end
