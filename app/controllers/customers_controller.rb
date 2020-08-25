class CustomersController < ApplicationController
  before_action :find_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: 'Cliente registrado com sucesso!'
    else
      render :new
    end
  end

  def show; end

  def edit; end
  
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Cliente editado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :contact_ids => [])
  end
  
  def find_customer
    @customer = Customer.find(params[:id])
  end

end
