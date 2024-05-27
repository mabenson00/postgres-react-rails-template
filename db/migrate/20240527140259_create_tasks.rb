class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :completed, default: false
      t.date :due_date

      t.timestamps
    end

    add_index :tasks, :completed
    add_index :tasks, :due_date
    add_index :tasks, :title
  end
end
