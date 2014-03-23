require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :customer_name => "Customer Name",
      :customer_email => "Customer Email",
      :subject => "Subject",
      :uniq_reference => "Uniq Reference",
      :ticket_status => "Ticket Status",
      :ticket_interface => "Ticket Interface",
      :ownership => "Ownership",
      :ticket_body => "MyText",
      :response => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Customer Name/)
    rendered.should match(/Customer Email/)
    rendered.should match(/Subject/)
    rendered.should match(/Uniq Reference/)
    rendered.should match(/Ticket Status/)
    rendered.should match(/Ticket Interface/)
    rendered.should match(/Ownership/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
