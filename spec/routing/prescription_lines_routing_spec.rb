require "spec_helper"

describe PrescriptionLinesController do
  describe "routing" do

    it "routes to #index" do
      get("/prescription_lines").should route_to("prescription_lines#index")
    end

    it "routes to #new" do
      get("/prescription_lines/new").should route_to("prescription_lines#new")
    end

    it "routes to #show" do
      get("/prescription_lines/1").should route_to("prescription_lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prescription_lines/1/edit").should route_to("prescription_lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prescription_lines").should route_to("prescription_lines#create")
    end

    it "routes to #update" do
      put("/prescription_lines/1").should route_to("prescription_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prescription_lines/1").should route_to("prescription_lines#destroy", :id => "1")
    end

  end
end
