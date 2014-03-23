json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :customer_name, :customer_email, :subject, :uniq_reference, :ticket_status, :ticket_interface, :ownership, :ticket_body, :response
  json.url ticket_url(ticket, format: :json)
end
