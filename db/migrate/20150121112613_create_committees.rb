class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committee do |t|
    t.string :name
    t.string :logo
    t.references :province
    t.references :user
 
     t.timestamps
    end
  end
end
