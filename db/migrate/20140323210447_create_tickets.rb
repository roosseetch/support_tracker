class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :subject
      t.string :uniq_reference
      t.string :ticket_status
      t.string :ticket_interface
      t.string :ownership
      t.text :ticket_body
      t.text :response

      t.timestamps
    end
  end
end
