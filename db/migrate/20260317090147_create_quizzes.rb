class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.belongs_to :user
      t.text :score
      
        t.references :word
      t.text :words, array: true, default: []

      t.timestamps
    end
  end
end
