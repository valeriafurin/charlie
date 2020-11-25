class AddMessageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :message, :text, :default => "I'm having a panic attack. Please call me."
  end
end
