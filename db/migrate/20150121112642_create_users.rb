class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string    :name
    t.string    :surname
    t.string    :login
    t.string    :crypted_password,    :null => false
    t.string    :password_salt,       :null => false
    t.string    :persistence_token,   :null => false
    t.boolean   :admin, :null => false, :default => 0
    t.integer   :type
    t.string    :city
    t.references :committee
    t.references :constituency

    t.timestamps
    end
  end
end
