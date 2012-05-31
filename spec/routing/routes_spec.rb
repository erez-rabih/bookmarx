require 'spec_helper'

describe "Routes" do
  describe "root" do
    it "should point to pages#welcome" do
      {:get => root_path}.should route_to(:controller => "pages", :action => "welcome")
    end
  end
end
