class AddLessonsQuestions < ActiveRecord::Migration[7.0]
 def self.up
    create_table :lessons_questions, :id => false do |t|
      t.integer :lesson_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :lessons_questions
  end
end
