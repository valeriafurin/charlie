class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def message
    current_user.message = params["/settings"][:message]
    if current_user.save
      redirect_to settings_path, notice: "Updated Message"
    else
      redirect_to settings_path, notice: "Something went wrong"
    end
  end

  def settings
    @contacts = Contact.where(user_id: current_user.id)
    @message = current_user.message
  end

  def toggle_voice
    if current_user.voice == true
      current_user.voice = false
      current_user.save
      # replace notice with button design (on/off)
      redirect_to settings_path, notice: "Voice disabled"
    else
      current_user.voice = true
      current_user.save
      # replace notice with button design (on/off)
      redirect_to settings_path, notice: "Voice enabled"
    end
  end


end
