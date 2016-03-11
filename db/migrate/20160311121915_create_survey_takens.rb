class CreateSurveyTakens < ActiveRecord::Migration
  def change
    create_table :surveys_takens do |t|

      t.references :user, index: true, null: false
      t.references :survey, index: true, null: false

      t.timestamps null: false

    end
  end
end
