class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :uniq_reference
      t.string :ticket_status
      t.string :ticket_interface
      t.text :ticket_body
      t.string :ownership

      t.timestamps
    end
  end
end
