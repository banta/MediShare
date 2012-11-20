require "spec_helper"

describe BednetsAndIllinessesController do
  describe "routing" do

    it "routes to #index" do
      get("/bednets_and_illinesses").should route_to("bednets_and_illinesses#index")
    end

    it "routes to #new" do
      get("/bednets_and_illinesses/new").should route_to("bednets_and_illinesses#new")
    end

    it "routes to #show" do
      get("/bednets_and_illinesses/1").should route_to("bednets_and_illinesses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bednets_and_illinesses/1/edit").should route_to("bednets_and_illinesses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bednets_and_illinesses").should route_to("bednets_and_illinesses#create")
    end

    it "routes to #update" do
      put("/bednets_and_illinesses/1").should route_to("bednets_and_illinesses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bednets_and_illinesses/1").should route_to("bednets_and_illinesses#destroy", :id => "1")
    end

  end
end
