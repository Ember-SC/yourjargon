require 'spec_helper'

describe Organization do
	it "validates uniqueness of" do
		params = {name: "Name"}
		Organization.create!(params)
		lambda { Organization.create!(params)}.should raise_error
	end
end