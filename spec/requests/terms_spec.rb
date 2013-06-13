require 'spec_helper'

describe "Terms" do
  describe "GET /api/terms" do
    it "works! (now write some real specs)" do
      get api_terms_path
      response.status.should be(200)
    end
  end
end
