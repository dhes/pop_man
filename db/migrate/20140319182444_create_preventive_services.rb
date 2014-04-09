class CreatePreventiveServices < ActiveRecord::Migration
  def change
    create_table :preventive_services do |t|
      t.string :source
      t.string :name
      t.text :rule
      t.boolean :in_scope

      t.timestamps
    end
  end
end
