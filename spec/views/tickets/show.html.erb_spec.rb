require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :customer_name => "Customer Name",
      :customer_email => "Customer Email",
      :uniq_reference => "Uniq Reference",
      :ticket_status => "Ticket Status",
      :ticket_interface => "Ticket Interface",
      :ticket_body => "MyText",
      :ownership => "Ownership"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Customer Name/)
    rendered.should match(/Customer Email/)
    rendered.should match(/Uniq Reference/)
    rendered.should match(/Ticket Status/)
    rendered.should match(/Ticket Interface/)
    rendered.should match(/MyText/)
    rendered.should match(/Ownership/)
  end
end
