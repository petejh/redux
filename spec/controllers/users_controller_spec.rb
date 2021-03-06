require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    
    it "renders the users/new template" do
      get :new
      response.should render_template :new
    end
  end
  
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
      end
      it "redirects to the Messages index" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to messages_path
      end
    end
    context "with invalid attributes" do
      it "does not create a new user" do
        expect { post :create, user: FactoryGirl.attributes_for(:invalid_user) }.to_not change(User, :count)
      end
      it "re-renders the new user form" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :new
      end
    end
  end
end
