require 'spec_helper'

describe BookmarksController do
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      sign_in Factory(:user)
      get 'index'
      response.should be_success
    end

    it "should require authentication" do
      get :index
      response.should be_redirect
    end
  end

end
