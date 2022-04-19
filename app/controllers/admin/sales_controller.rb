class Admin::SalesController < ApplicationController
  def index 
    #render :index implicitly 
    @sales = Sale.all
  end 
end
