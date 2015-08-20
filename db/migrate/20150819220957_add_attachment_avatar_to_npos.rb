class AddAttachmentAvatarToNpos < ActiveRecord::Migration
  def self.up
    change_table :npos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :npos, :avatar
  end
end
