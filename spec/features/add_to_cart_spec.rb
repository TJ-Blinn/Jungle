require 'rails_helper'

RSpec.feature "On Homepage, Visitor clicks Add to Cart button for a product ", type: :feature, js: true do
  
  # setup phase that adds 10 products using the RSpec before :each block:
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # visit the home page and click 'Add to Cart' buttons for one of the products.

  scenario "User clicks product 1's details" do
    # Act
    visit root_path
    
    #Exercise
    expect(page).to have_content 'My Cart (0)'
    first("article.product").find_button("Add").click
    
    # Verify
    # Checking to see if unique elements have generated specific to product show.html.erb
    expect(page).to have_content 'My Cart (1)'
    
    # Debug
    # puts "Current Page----->#{page.html}"
    save_screenshot
    
  end
end

# run test => bin/rspec spec/features/add_to_cart_spec.rb