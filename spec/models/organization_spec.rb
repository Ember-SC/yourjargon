require 'spec_helper'

describe Organization do
	it "validates uniqueness of" do
		params = {name: "Name"}
		Organization.create!(params)
		lambda { Organization.create!(params)}.should raise_error
	end

	it "has an owner" do
		user = User.create(email: "bla@bla.com")
		org = user.create_organization("My Org")
		expect(org.owner) == user
	end
end