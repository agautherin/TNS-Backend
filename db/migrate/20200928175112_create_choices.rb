class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :choice_text
      t.boolean :iscorrect

      
    end
  end
end
