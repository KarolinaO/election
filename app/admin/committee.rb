ActiveAdmin.register Committee do
  permit_params :name, :avatar, :province_ids => []



  form do |f|
    f.inputs "Committee Details" do

      f.input :name
      f.input :avatar
     f.collection_select :province_ids, Province.order(:name), :id, :name, {}, {multiple: true }
    end
    f.actions
  end

end