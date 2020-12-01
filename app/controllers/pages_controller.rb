class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # check private methods for new_session & timestamp_unique?
    # if current user is logged in, create a new session
    if current_user
      sess = new_session
      @sessions = Session.where(user_id: current_user.id)
      sess.save! if timestamp_unique?(sess, @sessions)
    end
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

  def get_help
    @contacts = Contact.where(user_id: current_user.id)
  end

  def dashboard
    @sessions = Session.group(user_id: current_user.id)
  end

  private

  def timestamp_unique?(new_sess, sessions)
    # access the timetamp of the new session
    time_data = new_sess.time
    # if its not the first session
    if @sessions[0] != nil
    # check if the new entry will not be a duplicate (excluding) of the last
      latest = sessions[-1].time
      latest.hour != time_data.hour && latest.day != time_data.day && latest.month != time_data.month && latest.year != time_data.year
    else
      # else if its the first session entry return:
      true
    end
  end

  def new_session
    a = Session.new
    a.time = Time.now
    a.user_id = current_user.id
    return a
  end
end
