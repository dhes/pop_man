class AddThreeBooleansToUspstfRecs < ActiveRecord::Migration
  def change
    add_column :uspstf_recs, :in_scope, :boolean
    add_column :uspstf_recs, :reminder_implemented, :boolean
    add_column :uspstf_recs, :score_implemented, :boolean
  end
end
