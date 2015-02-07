class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :quantity
      t.references :committee
      t.references :constituency



      t.timestamps
    end
  end
end
