require 'rails_helper'

RSpec.feature "On Homepage, Visitor clicks on product to navigate to details page ", type: :feature, js: true do
  pending "add some scenarios (or delete) #{__FILE__}"

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

  # click one of the product partials in order to navigate directly to a product detail page




end

# run test => bin/rspec spec/features
