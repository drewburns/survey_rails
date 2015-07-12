class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
			t.references :user, index: true, foreign_key: true
			t.references :survey, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
