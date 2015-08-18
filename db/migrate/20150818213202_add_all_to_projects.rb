class AddAllToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :user
      t.belongs_to :task
    end
  end
end
