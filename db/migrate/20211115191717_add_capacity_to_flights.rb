class AddCapacityToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :capacity, :integer
  end
end
