class AddAttachmentAvatarToCommittee< ActiveRecord::Migration
  def self.up
    change_table :committee do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :committee, :avatar
  end
end