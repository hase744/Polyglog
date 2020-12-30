class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.text :name, default: "User"

      t.timestamps
    end
  end
end
