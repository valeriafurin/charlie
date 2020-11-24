class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def settings
    @contacts = Contact.where(user_id: current_user.id)
    @message = current_user.message
  end


end
