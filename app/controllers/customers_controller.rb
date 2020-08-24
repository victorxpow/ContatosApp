class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.all
  end
end
