class AddIsCompleteToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :is_complete, :boolean, null: false, default: false
  end
end
