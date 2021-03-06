class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
      # debugger
    if ! params[:search].blank?
      @ticket = Ticket.find_by slug: params[:search].downcase
      redirect_to ticket_path(@ticket) unless @ticket.nil?
    end
    @tickets = Ticket.all

  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @whois = :customer
  end

  # GET /tickets/1/edit
  def edit
    if @ticket.ticket_status.in? ['Cancelled', 'Completed']
      redirect_to ticket_path(@ticket), alert: "This ticket is
      #{@ticket.ticket_status}."
    else
      if user_signed_in?
        @whois = :staff
      else
        @whois = :customer
      end
    end
  end
  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.ticket_status = 'Waiting for Staff Response'
    @ticket.ticket_interface = 'New unassigned tickets'
    @ticket.make_uniq_reference

    TicketConfirmingMailer.new_ticket_confirmation(@ticket).deliver

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def track
    # debugger
    if user_signed_in?
      # @tickets = Ticket.all.page(params[:page])
      @tickets = Ticket.order(:id).page(params[:page]).per(5)
    else
      redirect_to new_user_session_path, alert: 'Please Sign in.'
    end
  end

  def update
    if user_signed_in?
      @ticket.ticket_status = params[:ticket][:ticket_status] || 'Waiting for Customer'
      @ticket.ticket_interface = (@ticket.ticket_status.in? ['Cancelled', 'Completed']) ? 'Closed Tickets' : 'Open Tickets'
      # debugger
      @ticket.ownership = params[:ticket][:ownership] || current_user.username
      TicketConfirmingMailer.new_ticket_confirmation(@ticket).deliver
    else
      @ticket.ticket_status = 'On Hold'
      @ticket.ticket_interface = 'On hold tickets'
    end
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @ticket }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:customer_name, :customer_email, :subject, :uniq_reference, :ticket_status, :ticket_interface, :ownership, :ticket_body, :response)
    end
end
