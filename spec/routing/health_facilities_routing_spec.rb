require "spec_helper"

describe HealthFacilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/health_facilities").should route_to("health_facilities#index")
    end

    it "routes to #new" do
      get("/health_facilities/new").should route_to("health_facilities#new")
    end

    it "routes to #show" do
      get("/health_facilities/1").should route_to("health_facilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/health_facilities/1/edit").should route_to("health_facilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/health_facilities").should route_to("health_facilities#create")
    end

    it "routes to #update" do
      put("/health_facilities/1").should route_to("health_facilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/health_facilities/1").should route_to("health_facilities#destroy", :id => "1")
    end

  end
end
