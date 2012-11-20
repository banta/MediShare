require 'spec_helper'

describe "BednetsAndIllinesses" do
  describe "GET /bednets_and_illinesses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bednets_and_illinesses_path
      response.status.should be(200)
    end
  end
end
