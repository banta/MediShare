require "spec_helper"

describe MedicinesController do
  describe "routing" do

    it "routes to #index" do
      get("/medicines").should route_to("medicines#index")
    end

    it "routes to #new" do
      get("/medicines/new").should route_to("medicines#new")
    end

    it "routes to #show" do
      get("/medicines/1").should route_to("medicines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/medicines/1/edit").should route_to("medicines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/medicines").should route_to("medicines#create")
    end

    it "routes to #update" do
      put("/medicines/1").should route_to("medicines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/medicines/1").should route_to("medicines#destroy", :id => "1")
    end

  end
end
