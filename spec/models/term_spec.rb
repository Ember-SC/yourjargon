require 'spec_helper'

describe Term do
	it 'has versions that hold the history of what the terms were when they were saved' do
	  version1_params = {name: 'Term 1', description: 'Desc 1'}
	  version2_params = {name: 'Term 2', description: 'Desc 2'}
	  term = Term.create!(version1_params)
	  term.update_attributes!(version2_params)
	  term.versions.should have(2).items
	  term.previous_version.description.should eq('Desc 1')
	end

	it 'validates uniqueness of name within an organization' do
		org = double(:organization)
		org.stub!(:id).and_return(1)
		params = {name: 'Term 1', organization_id: 1}
	  term = Term.create!(params)
	  lambda { Term.create!(params) }.should raise_error
	end
end
