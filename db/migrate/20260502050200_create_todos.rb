class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :body
      t.date :due_date
      t.boolean :completed, null: false, default: false
      t.string :tags
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
