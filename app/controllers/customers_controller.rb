class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end
end
