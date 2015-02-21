ActiveAdmin.register Constituency do

  permit_params :name, :voters, :province_id



  form do |f|
    f.inputs "Constituency Details" do

      f.input :name
      f.input :voters
      f.collection_select :province_id, Province.order(:name), :id, :name, {}
    end
    f.actions
  end

end