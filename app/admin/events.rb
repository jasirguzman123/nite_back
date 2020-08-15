ActiveAdmin.register Event do

  permit_params :name, :address, :owner_type, :owner_id, :starting_hour, :main_category,
                :ending_hour, :description, :latitude, :longitude, images: []

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.latlng height: 400, api_key: Rails.application.credentials.dig(:google_maps, :api_key),
               id_lat: 'event_latitude', id_lng: 'event_longitude',
               default_lat: 10.9839725, default_lng: -74.8880589
      f.input :latitude
      f.input :longitude
      f.input :description
      f.input :starting_hour
      f.input :ending_hour
      f.input :main_category
      f.input :owner_type, as: :hidden, input_html: { value: 'Establishment' }
      f.input :owner_id, as: :select, collection: Establishment.all
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
