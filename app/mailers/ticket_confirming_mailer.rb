class TicketConfirmingMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_ticket_confirmation(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email,
         subject: 'You created new ticket')
  end
end
