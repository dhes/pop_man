class CreateUspstfRecs < ActiveRecord::Migration
  def change
    create_table :uspstf_recs do |t|
      t.string :topic
      t.text :description
      t.string :grade
      t.string :release_date

      t.timestamps
    end
  end
end
