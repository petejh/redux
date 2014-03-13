require 'spec_helper'

describe "users/new.html.erb" do
  it "adds a new user and displays the messages view" do
    expect {
      visit new_user_path
      fill_in "Login", with: "jerry"
      fill_in "Password", with: "abcd1234"
      fill_in "Password confirmation", with: "abcd1234"
      click_button "Create User"
    }.to change(User, :count).by(1)
    current_path.should == messages_path
  end
end
