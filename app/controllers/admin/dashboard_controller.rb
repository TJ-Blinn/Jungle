class Admin::DashboardController < ApplicationController
  def show
    @total_product = Product.count
    @total_category = Category.count
  end
end
