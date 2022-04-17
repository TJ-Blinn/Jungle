class Admin::DashboardController < ApplicationController
#  include HttpAuthConcern
  http_basic_authenticate_with name: ENV['HTTP_Basic_Authentication_username'], password: ENV['HTTP_Basic_Authentication_password']

  def show
    @total_product = Product.count
    @total_category = Category.count
  end
end
