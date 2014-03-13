require 'spec_helper'

describe MessagesController do
  describe "GET index" do
    it "populates a list of all messages" do
      all_messages = FactoryGirl.create_list(:message, 3, author: mock_model(User))
      get :index
      expect(assigns(:messages)).to match_array(all_messages)
    end
  end
end
