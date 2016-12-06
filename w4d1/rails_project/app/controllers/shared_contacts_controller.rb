class SharedContactsController < ApplicationController


  def create
    shared_contact = SharedContact.new(shared_contact_params)
    if shared_contact.save
      render json: shared_contact
    else
      render json: shared_contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    shared_contact = SharedContact.find(params[:id])
    if shared_contact.destroy
      render json: shared_contact
    else
      render json: shared_contact.errors.full_messages, status: :unprocessable_entity
    end
  end


  def shared_contact_params
    # params.require(:contact_id)
    # params.require(:user_id)
    params.require(:shared_contact).permit(:contact_id, :user_id)
  end

end
