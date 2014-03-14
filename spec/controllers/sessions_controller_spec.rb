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
        # make this go away and switch @user back to a local variable once the "stores the session ID" test passes
        post :create, credentials
        expect(assigns(:user)).to_not eq(nil)
      end

      it "stores the session ID" do
        pending
        post :create, credentials
        expect(assigns(session[:user_id])).to eq(valid_user.id)
      end
      
      it "redirects to the application root" do
        expect(post :create, credentials).to redirect_to root_url
      end
    end
  end

  describe "DELETE destroy" do
  end
end
