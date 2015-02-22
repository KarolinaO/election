ActiveAdmin.register User do
  permit_params :name, :surname, :login, :city, :password, :constituency_id

      index do
        selectable_column
        id_column
        column :current_sign_in_at
        column :sign_in_count
        column :created_at
        actions
      end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do

      f.input :name
      f.input :surname
      f.input :login
      f.input :city
      f.input :password
      f.label :constituency
      f.collection_select :constituency_id, Constituency.all.order('name ASC'), :id, :name, {}
      f.label :role
      f.select :role, ['0','1']
    end
    f.actions
  end

end