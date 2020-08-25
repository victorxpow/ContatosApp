class ContactsController < ApplicationController
  before_action :find_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: 'Cliente registrado com sucesso!'
    else
      render :new
    end
  end

  def show; end

  def edit; end
  
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Cliente editado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end
  
  def find_contact
    @contact = Contact.find(params[:id])
  end

end
