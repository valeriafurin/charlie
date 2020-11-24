class UsersController < ApplicationController

  def message
    current_user.message = params["message"]
    current_user.save
  end

  def contacts
    @contacts = Contact.where(user_id: current_user.id)
  end

  def toggle_voice
    if current_user.voice
      current_user.voice = false
      current_user.save
    else
      current_user.voice = true
      current_user.save
    end
  end
end
