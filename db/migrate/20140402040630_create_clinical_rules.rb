class CreateClinicalRules < ActiveRecord::Migration
  def change
    create_table :clinical_rules do |t|
      t.string :name
      t.string :sex
      t.integer :lowage
      t.integer :highage
      t.string :problem
      t.string :medication
      t.string :allergy
      t.text :test
      t.text :comment

      t.timestamps
    end
  end
end
