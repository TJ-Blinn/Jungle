require 'rails_helper'


# REMINDERS: 
    # feature block => describe block
    # scenario block => it block
    
    
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
      
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

  scenario "They see all products" do    
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product', count: 10
  end
end

# run test => bin/rspec spec/features
# screenshot saved and located in the tmp/capybara folder.