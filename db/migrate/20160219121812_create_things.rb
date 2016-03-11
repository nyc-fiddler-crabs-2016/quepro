class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
