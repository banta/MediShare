require "spec_helper"

describe DataMiningsController do
  describe "routing" do

    it "routes to #index" do
      get("/data_minings").should route_to("data_minings#index")
    end

    it "routes to #new" do
      get("/data_minings/new").should route_to("data_minings#new")
    end

    it "routes to #show" do
      get("/data_minings/1").should route_to("data_minings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/data_minings/1/edit").should route_to("data_minings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/data_minings").should route_to("data_minings#create")
    end

    it "routes to #update" do
      put("/data_minings/1").should route_to("data_minings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/data_minings/1").should route_to("data_minings#destroy", :id => "1")
    end

  end
end
