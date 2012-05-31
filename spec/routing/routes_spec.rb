require 'spec_helper'

describe "Routes" do
  describe "root" do
    it "should route to pages#welcome" do
      {:get => root_path}.should route_to(:controller => "pages", :action => "welcome")
    end
  end

  describe "login" do
    it "should route to sessions#new" do
      {:get => login_path}.should route_to(:controller => "devise/sessions", :action => "new")
    end
  end
  
  describe "logout" do
    it "should route to sessions#new" do
      {:delete => logout_path}.should route_to(:controller => "devise/sessions", :action => "destroy")
    end
  end

  describe "sign up" do
    it "should route to registrations#new" do
      {:get => signup_path}.should route_to(:controller => "devise/registrations", :action => "new")
    end
  end
end
