class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :phone_number
      t.string :name

      t.timestamps
    end
  end
end
