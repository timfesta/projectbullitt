class AddNpoIdToTasks < ActiveRecord::Migration
	change_table :tasks do |t|
		t.belongs_to :npo
	end
end

