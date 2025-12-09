class CreateChapters < ActiveRecord::Migration[8.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :writing_id

      t.timestamps
    end
  end
end
