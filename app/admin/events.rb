ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :owner_type, :owner_id, :starting_hour, :ending_hour, :description, images: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :owner_type, :owner_id, :starting_hour, :ending_hour, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :description
      f.input :starting_hour
      f.input :ending_hour
      f.input :status
      f.input :images, as: :file, input_html: { multiple: true }
      f.actions
    end
  end

  index do
    id_column
    column :name
    column :address
    column :owner
    column :starting_hour
    column :ending_hour
    column :description
    column :categories
    actions
  end
  
end
