class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.text :questions, array: true, default: []
      t.text :level
      t.text :topic

      t.timestamps
    end
  end
end
