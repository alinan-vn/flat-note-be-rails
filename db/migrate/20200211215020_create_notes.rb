class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.string :tags

      t.timestamps
    end
  end
end
