require 'spec_helper'

describe Term do
  it "has versions" do
  	term = Term.new(name: "Test", description: "descriptions descriptions")
  	term.save
  	term.name = "New Test"
  	term.save
  	term.versions.length.should equal(2)
  end
end
