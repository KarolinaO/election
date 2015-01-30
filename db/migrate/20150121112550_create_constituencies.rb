class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituency do |t|
    t.integer :number
    t.integer :voters
    t.integer :canceled_votes_1
    t.integer :canceled_votes_2
    t.integer :canceled_votes_3
    t.references :province
    t.references :user
		
      t.timestamps
    end
  end
end
