class AddUserIdToNpos < ActiveRecord::Migration
  change_table :npos do |t|
    t.belongs_to :user
  end
end
