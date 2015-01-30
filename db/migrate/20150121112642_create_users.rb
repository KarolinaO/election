class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
    t.integer :name
    t.integer :surname
    t.integer :password
    t.integer :type
    t.string :city
    t.references :committee
    t.references :constituency
      t.timestamps
    end
  end
end
