class AddImplementedFieldToPreventiveServices < ActiveRecord::Migration
  def change
    add_column :preventive_services, :implemented, :boolean
  end
end
