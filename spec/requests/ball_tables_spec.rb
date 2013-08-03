require 'spec_helper'

describe "BallTables" do
  describe "GET /ball_tables" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ball_tables_path
      response.status.should be(200)
    end
  end
end
