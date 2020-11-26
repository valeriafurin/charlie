class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :phone_number, default: ""
      t.string :name, default: ""

      t.timestamps
    end
  end
end
