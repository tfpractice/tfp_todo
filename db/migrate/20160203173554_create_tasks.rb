class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.datetime :due_date
      t.datetime :completed_on
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
