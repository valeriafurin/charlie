require 'json'

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

  # Message sent from Twilio to Valerias number
  def send_message
    message = "I'm having a panic attack. Please write me."
    TwilioTextMessenger.new(message).call
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
    @sessions = Session.where(user_id: current_user.id) if current_user
  end


  def save_session
    #store new session in variable
    new_sess = Session.new(user_id: current_user.id, time: Time.now)
    #if its the first session create session
    new_sess.save! if @sessions.empty?
    #else if the last session recorded is 5 or more mins ago, create a new session
    new_sess.save! if (new_sess.time - @sessions.last.created_at) > 300

  end
end

#  ----for later fixing (functionality for dashboard graph)

#    @data = {}
#    @sessions.each do |session|
#      x = Time.new(session.created_at.year, month_with_zero(session.created_at.month), day_with_zero(session.created_at.day)).asctime[0..9]
#      @data[x] = session.created_at.hour
#    end
#    {"monday 01.02.12" => {10:13, 11:30, ..., }, "tuesday 02.02.12" => {15:12, ...}}

#  def month_with_zero(month)
#    month.to_s.length == 1 ? "0#{month}".to_i : month
#  end

#  def day_with_zero(day)
#    day.to_s.length == 1 ? "0#{day}".to_i : day
#  end