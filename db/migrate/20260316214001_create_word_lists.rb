class CreateWordLists < ActiveRecord::Migration[7.0]
  def change
    create_table :word_lists do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :word

      t.timestamps
    end
  end
end
