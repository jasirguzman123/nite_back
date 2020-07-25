ActiveAdmin.register Establishment do

  permit_params :name, :address, :latitude, :longitude
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.latlng height: 400, api_key: Rails.application.credentials.dig(:google_maps, :api_key),
               id_lat: 'establishment_latitude', id_lng: 'establishment_longitude',
               default_lat: 10.9839725, default_lng: -74.8880589
      f.input :latitude
      f.input :longitude
      f.actions
    end
  end
end
