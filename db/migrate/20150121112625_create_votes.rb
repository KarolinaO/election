class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :status
      t.integer :quantity
      t.references :committee
    t.references :constituency
      t.references :province


      t.timestamps
    end
  end
end
