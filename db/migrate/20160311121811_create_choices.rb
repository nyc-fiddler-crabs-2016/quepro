class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name, null: false
      t.references :question, index: true, null: false

      t.timestamps null: false
    end
  end
end
