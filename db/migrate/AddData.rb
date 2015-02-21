class AddDataToUsers < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :user do |t|
        dir.up   { t.change :name, :integer }
        dir.down { t.change :name, :string }
      end
    end
  end
end