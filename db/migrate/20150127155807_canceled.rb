class Canceled < ActiveRecord::Migration
  def change
    create_table :canceled do |t|
      t.text :reason

      t.references :vote

      t.timestamps
  end
end
end