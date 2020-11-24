class AddMessageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :message, :text
  end
end
