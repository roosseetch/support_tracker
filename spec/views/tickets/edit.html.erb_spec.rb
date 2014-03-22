require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :customer_name => "MyString",
      :customer_email => "MyString",
      :uniq_reference => "MyString",
      :ticket_status => "MyString",
      :ticket_interface => "MyString",
      :ticket_body => "MyText",
      :ownership => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do
      assert_select "input#ticket_customer_name[name=?]", "ticket[customer_name]"
      assert_select "input#ticket_customer_email[name=?]", "ticket[customer_email]"
      assert_select "input#ticket_uniq_reference[name=?]", "ticket[uniq_reference]"
      assert_select "input#ticket_ticket_status[name=?]", "ticket[ticket_status]"
      assert_select "input#ticket_ticket_interface[name=?]", "ticket[ticket_interface]"
      assert_select "textarea#ticket_ticket_body[name=?]", "ticket[ticket_body]"
      assert_select "input#ticket_ownership[name=?]", "ticket[ownership]"
    end
  end
end
