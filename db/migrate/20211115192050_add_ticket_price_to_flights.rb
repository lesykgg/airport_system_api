class AddTicketPriceToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :ticket_price_cents, :integer
    add_column :flights, :ticket_price_currency, :string, default: :UAH
  end
end
