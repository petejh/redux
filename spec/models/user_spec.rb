require 'spec_helper'

describe User do
  it "is valid with valid attributes" do
    FactoryGirl.build(:user).should be_valid
  end

  it { should validate_presence_of :login }
  it "is invalid without a unique login" do
    FactoryGirl.create(:user)
    expect(User.new).to validate_uniqueness_of :login
  end
  
  it { should have_secure_password }
  
  it { should have_many :messages }
  
  describe "#own_messages" do
    let(:jerry) { FactoryGirl.create(:user, login: "jerry") }
    let(:bobby) { FactoryGirl.create(:user, login: "bobby") }
    let(:jerrys_messages) { FactoryGirl.create_list(:message, 2, author: jerry) }
    let(:bobbys_message) { FactoryGirl.create(:message, author: bobby) }

    it "finds all of its own messages" do
      jerry.own_messages.should == jerrys_messages
    end
  end
  
  describe "#write_message" do
    context "when logged in" do
      it "writes a message"
      it "categorizes a message"
    end
  end
end
