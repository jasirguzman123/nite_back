class AddLocationToEstablishments < ActiveRecord::Migration[6.0]
  def change
    add_column :establishments, :latitude, :float
    add_column :establishments, :longitude, :float
  end
end
