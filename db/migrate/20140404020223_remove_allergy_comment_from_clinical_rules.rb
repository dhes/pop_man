class RemoveAllergyCommentFromClinicalRules < ActiveRecord::Migration
  def change
    remove_column :clinical_rules, :allergy, :string
    remove_column :clinical_rules, :comment, :text
  end
end
