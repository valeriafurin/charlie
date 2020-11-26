class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def message
    current_user.message = params["/settings"][:message]
    if current_user.save
      redirect_to settings_path, notice: "Message updated succesfully"
    else
      redirect_to settings_path, alert: "Message must be min. 10 characters"
    end
  end

  def settings
    @contacts = Contact.where(user_id: current_user.id)
  end

  def toggle_voice
    if current_user.voice == true
      current_user.voice = false
      current_user.save
      redirect_to settings_path
    else
      current_user.voice = true
      current_user.save
      redirect_to settings_path
    end
  end


end
