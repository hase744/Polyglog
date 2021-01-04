class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.text :person
      t.integer :original_id
      t.text :original_message
      t.text :corrected_message

      t.timestamps
    end
  end
end
