class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
    t.string :province_name
    t.integer :seats

      t.timestamps
    end
  end
end
