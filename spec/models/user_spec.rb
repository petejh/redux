require 'spec_helper'

describe User do
  it "is valid with valid attributes" do
    User.new(login: "jackoroses").should be_valid
  end
  
  it "is not valid without a login" do
    User.new(login: nil).should_not be_valid
  end
  
  it "is not valid without a unique login" do
    User.create(login: "jackoroses")
    User.new(login: "jackoroses").should_not be_valid
  end
  
  describe "#own_messages" do
    before(:each) do
      @jerry = User.create(login: "jerry")
      @bobby = User.create(login: "bobby")
    end
    
    it "finds all of its own messages" do
      2.times { messages.push Message.create(text: "AAA", author: @jerry) }
      messages.push Message.create(text: "BBB", author: @bobby)
      @jerry.own_messages.should == messages[0..1]
    end
  end
  
  describe "#write_message" do
    context "when logged in" do
      it "writes a message"
      it "categorizes a message"
    end
  end
end
