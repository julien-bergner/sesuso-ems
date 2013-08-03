require "spec_helper"

describe BallTablesController do
  describe "routing" do

    it "routes to #index" do
      get("/ball_tables").should route_to("ball_tables#index")
    end

    it "routes to #new" do
      get("/ball_tables/new").should route_to("ball_tables#new")
    end

    it "routes to #show" do
      get("/ball_tables/1").should route_to("ball_tables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ball_tables/1/edit").should route_to("ball_tables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ball_tables").should route_to("ball_tables#create")
    end

    it "routes to #update" do
      put("/ball_tables/1").should route_to("ball_tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ball_tables/1").should route_to("ball_tables#destroy", :id => "1")
    end

  end
end
