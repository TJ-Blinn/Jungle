require 'rails_helper'


# REMINDERS: 
    # feature block => describe block
    # scenario block => it block


RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  scenario "They see all products" do
    
    # ACT
    visit '/'

    # DEBUG / VERIFY
    save_screenshot "test.png"
  end

end

# run test => bin/rspec spec/features
# screenshot saved and located in the tmp/capybara folder.