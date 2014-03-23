class Ticket < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uniq_reference, use: :slugged

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_UNIQ_REFERENCE = /\w{3}-\d{3}-\w{3}-\d{3}-\w{3}/

  validates :customer_name,  presence: true, length: { maximum: 50 }
  validates :subject,  presence: true, length: { maximum: 50 }
  validates :ticket_body,  presence: true, length: { maximum: 1000 }
  validates :customer_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  # after_initialize :make_uniq_reference

  def self.all_statuses
    ['Waiting for Staff Response', 'Waiting for Customer', 'On Hold',
     'Cancelled', 'Completed']
  end

  def self.all_interfaces
    ['New unassigned tickets', 'Open Tickets', 'On hold tickets',
     'Closed Tickets']
  end

  def make_uniq_reference
    begin
      self.uniq_reference = VALID_UNIQ_REFERENCE.gen.upcase
    end while Ticket.where(uniq_reference: self.uniq_reference).exists?
  end
end
