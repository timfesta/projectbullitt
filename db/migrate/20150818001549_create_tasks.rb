class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :issue
      t.string :description
      t.string :language
      t.string :framework

      t.timestamps null: false
    end
  end
end
