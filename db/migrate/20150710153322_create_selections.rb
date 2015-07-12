class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
    	t.references :choice, index: true, foreign_key: true
    	t.references :question, index: true, foreign_key: true
    	t.references :completion, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
