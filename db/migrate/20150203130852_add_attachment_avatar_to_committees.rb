class AddAttachmentAvatarToCommittees < ActiveRecord::Migration
    def change
      change_table :committees do |t|
        t.attachment :avatar
      end
    end
end
