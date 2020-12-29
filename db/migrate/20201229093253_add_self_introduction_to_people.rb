class AddSelfIntroductionToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :self_introduction, :text
  end
end
