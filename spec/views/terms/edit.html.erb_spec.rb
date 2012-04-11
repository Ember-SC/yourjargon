require 'spec_helper'

describe "terms/edit" do
  before(:each) do
    @term = assign(:term, stub_model(Term,
      :term => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit term form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => terms_path(@term), :method => "post" do
      assert_select "input#term_term", :name => "term[term]"
      assert_select "input#term_description", :name => "term[description]"
    end
  end
end
