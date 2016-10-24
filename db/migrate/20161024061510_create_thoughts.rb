class CreateThoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts do |t|
      t.references :idea, foreign_key: true
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
