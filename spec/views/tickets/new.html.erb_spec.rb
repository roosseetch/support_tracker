require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :customer_name => "MyString",
      :customer_email => "MyString",
      :subject => "MyString",
      :uniq_reference => "MyString",
      :ticket_status => "MyString",
      :ticket_interface => "MyString",
      :ownership => "MyString",
      :ticket_body => "MyText",
      :response => "MyText"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_customer_name[name=?]", "ticket[customer_name]"
      assert_select "input#ticket_customer_email[name=?]", "ticket[customer_email]"
      assert_select "input#ticket_subject[name=?]", "ticket[subject]"
      assert_select "input#ticket_uniq_reference[name=?]", "ticket[uniq_reference]"
      assert_select "input#ticket_ticket_status[name=?]", "ticket[ticket_status]"
      assert_select "input#ticket_ticket_interface[name=?]", "ticket[ticket_interface]"
      assert_select "input#ticket_ownership[name=?]", "ticket[ownership]"
      assert_select "textarea#ticket_ticket_body[name=?]", "ticket[ticket_body]"
      assert_select "textarea#ticket_response[name=?]", "ticket[response]"
    end
  end
end
