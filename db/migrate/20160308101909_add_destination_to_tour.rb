class AddDestinationToTour < ActiveRecord::Migration
  def change
    add_column :tours, :destination, :string
  end
end
