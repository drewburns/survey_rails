class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :text
    	t.string :question_type
    	t.references :survey, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
