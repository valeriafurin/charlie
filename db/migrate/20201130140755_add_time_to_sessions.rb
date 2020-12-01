class AddTimeToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :time, :time
  end
end
