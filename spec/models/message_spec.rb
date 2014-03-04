require 'spec_helper'

describe Message do
  it "is valid with valid attributes" do
    message = build_valid_message
    message.should be_valid
  end
  
  it "is not valid without text" do
    message = build_valid_message
    message.text = nil
    message.should_not be_valid
  end
  
  it "is not valid without an author" do
    message = build_valid_message
    message.author = nil
    message.should_not be_valid
  end

  def build_valid_message
    Message.new(
      text: "It must have been the roses",
      author: mock_model("User")
      )
  end
end
