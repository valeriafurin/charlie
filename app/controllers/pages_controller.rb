class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_sessions, only: [:home, :dashboard]
  before_action :set_contacts, only: [:settings, :get_help]

  def home
    #if user is logged in, save the session
    save_session if current_user
  end

  def settings
  end

  def get_help
  end

  def dashboard
  end

  def send_message
    redirect_to root_path, notice: "Message sent. Keep breathing."
  end

  def message
    current_user.message = params["/settings"][:message]
    if current_user.save
      redirect_to settings_path, notice: "Message updated succesfully"
    else
      redirect_to settings_path, alert: "Message must be min. 10 characters"
    end
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

  private

  def set_contacts
    @contacts = Contact.where(user_id: current_user.id)
  end

  def set_sessions
    @sessions = Session.where(user_id: current_user.id)
  end

  def save_session
    #store new session in variable
    new_sess = Session.new(user_id: current_user.id, time: Time.now)
    #if its the first session create session
    new_sess.save if @sessions.empty?
    #else if the last session recorded is 5 or more mins ago, create a new session
    new_sess.save if (new_sess.time - @sessions.last.time) > 300
  end
end
