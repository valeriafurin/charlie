class ContactsController < ApplicationController
  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to settings_path, notice: "Updated contact details"
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end
end
