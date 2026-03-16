class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :level
      t.string :invoicee
      t.text :schedule

      t.timestamps
    end
  end
end
