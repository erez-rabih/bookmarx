require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'welcome'" do
    it "returns http success" do
      get 'welcome'
      response.should be_success
    end
  end

end
