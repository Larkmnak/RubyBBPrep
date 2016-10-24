class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :book
      t.text :content
      t.references :user, foreign_key: true
      t.references :thought, foreign_key: true

      t.timestamps
    end
  end
end
