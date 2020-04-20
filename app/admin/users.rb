ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password_digest, :name, :last_name, :phone, :birthdate
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :password_digest, :name, :last_name, :phone, :birthdate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :email
    column :name
    column :last_name
    column :phone
    column :birthdate
    column :created_at
    actions
  end
  
end
