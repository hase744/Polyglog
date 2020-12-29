class AddLanguageToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :native_language, :string
    add_column :people, :language_to_study, :string
  end
end

