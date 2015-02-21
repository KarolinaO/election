class CreateCommitteesProvinces < ActiveRecord::Migration
  def self.up
    create_table 'committees_provinces', :id => false do |t|
      t.column :committee_id, :integer
      t.column :province_id, :integer
    end
  end
end