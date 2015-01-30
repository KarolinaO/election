class CreateCanceleds < ActiveRecord::Migration
  def change
    create_table :canceleds do |t|

      t.timestamps
    end
  end
end
