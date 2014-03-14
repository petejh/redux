require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the signin form" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "when credentials are valid" do
      let(:credentials) { FactoryGirl.attributes_for(:user) }
      let!(:valid_user) { FactoryGirl.create(:user, credentials) }
      
      it "finds the user" do
        pending("figure out how to write this spec without requiring the application code to use an instance variable")
#        User.should_receive(:where).with({:login=>"#{credentials[:login]}"})
        post :create, credentials
        expect(assigns(:user)).to eq(valid_user)
      end

      it "stores the session ID" do
        post :create, credentials
        # is this expectation doing what I think it's doing?
        # why does this work with the request object, but not the response object?
        expect(request.session[:user_id]).to eq(valid_user.id)
      end
      
      it "redirects to the application root" do
        expect(post :create, credentials).to redirect_to root_url
      end
    end
    
    context "when credentails are invalid" do
      context "when the user login can't be found" do
        let(:credentials) { FactoryGirl.attributes_for(:user, login: 'schnecky') }
        let(:wrong_login) { FactoryGirl.attributes_for(:user, login: 'strudemeier') }
        let!(:valid_user) { FactoryGirl.create(:user, credentials) }
        
        it "renders the user signin form" do
          expect(post :create, wrong_login).to render_template :new
        end
      end

      context "when the user's password can't be authenticated" do
        let(:credentials) { FactoryGirl.attributes_for(:user, login: 'schnecky', password: 'abcd1234', password_confirmation: 'abcd1234') }
        let(:wrong_password) { FactoryGirl.attributes_for(:user, login: 'schnecky', password: 'wxyz5678', password_confirmation: 'wxyz5678') }
        let!(:valid_user) { FactoryGirl.create(:user, credentials) }
        
        it "renders the user signin form" do
          expect(post :create, wrong_password).to render_template :new
        end
      end
    end
  end

  describe "DELETE destroy" do
    let(:credentials) { FactoryGirl.attributes_for(:user) }
    let!(:valid_user) { FactoryGirl.create(:user, credentials) }
    
    it "clears the session ID" do
      post :create, credentials
      delete :destroy, id: valid_user.id
      # is this expectation doing what I think it's doing?
      # why does this work with the request object, but not the response object?
      expect(request.session[:user_id]).to eq(nil)
    end
    
    it "redirects to the application root" do
      expect(delete :destroy, id: valid_user.id).to redirect_to root_url
    end
  end
end
