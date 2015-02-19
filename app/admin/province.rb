ActiveAdmin.register Province do

  permit_params :name, :seats



  form do |f|
    f.inputs "Province Details" do

      f.input :name
      f.input :seats
   
    end
    f.actions
  end

end