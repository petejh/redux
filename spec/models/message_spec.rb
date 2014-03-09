require 'spec_helper'

describe Message do
  it "is valid with valid attributes" do
    FactoryGirl.build(:message).should be_valid
  end

  it { should validate_presence_of :text }
  it { should validate_presence_of :author }
  
  it { should belong_to :author }
end
