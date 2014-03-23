class Ticket < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uniq_reference, use: :slugged

  validates :customer_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :customer_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  after_initialize :make_uniq_reference

  private
    def make_uniq_reference
      begin
        self.uniq_reference = /\w{3}-\d{3}-\w{3}-\d{3}-\w{3}/.gen
      end while Ticket.where(uniq_reference: self.uniq_reference).exists?
    end
end
