require 'spec_helper'

describe "messages/index.html.erb" do
  it "displays the list of all messages" do
    all_messages = FactoryGirl.create_list(:message, 3, author: mock_model(User))
    visit messages_path
    page.should have_content("All Messages")
    all('li').count.should eq(all_messages.count)
  end
end
