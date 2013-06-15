require 'spec_helper'

describe User do
	it "can create organizations and assigns the user as owner" do
	  user = User.create!(email: "me@me.com")
      org = user.create_organization("Bling")
      expect(org.id).to be
	end
end