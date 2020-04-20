ActiveAdmin.register Category do
  permit_params :name, :color
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :color
      f.actions
    end
  end
end
