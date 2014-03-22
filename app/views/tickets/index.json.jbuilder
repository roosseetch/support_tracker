json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :customer_name, :customer_email, :uniq_reference, :ticket_status, :ticket_interface, :ticket_body, :ownership
  json.url ticket_url(ticket, format: :json)
end
