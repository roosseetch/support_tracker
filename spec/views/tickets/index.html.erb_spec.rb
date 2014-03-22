require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :customer_name => "Customer Name",
        :customer_email => "Customer Email",
        :uniq_reference => "Uniq Reference",
        :ticket_status => "Ticket Status",
        :ticket_interface => "Ticket Interface",
        :ticket_body => "MyText",
        :ownership => "Ownership"
      ),
      stub_model(Ticket,
        :customer_name => "Customer Name",
        :customer_email => "Customer Email",
        :uniq_reference => "Uniq Reference",
        :ticket_status => "Ticket Status",
        :ticket_interface => "Ticket Interface",
        :ticket_body => "MyText",
        :ownership => "Ownership"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Customer Name".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Email".to_s, :count => 2
    assert_select "tr>td", :text => "Uniq Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket Status".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket Interface".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ownership".to_s, :count => 2
  end
end
