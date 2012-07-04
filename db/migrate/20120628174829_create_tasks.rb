class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.boolean :completed, :default => false
      t.integer :list_id

      t.timestamps
    end
  end
end
