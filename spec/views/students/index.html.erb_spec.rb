require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/index.html.erb" do
  include StudentsHelper

  before(:each) do
    assigns[:students] = [
      stub_model(Students),
      stub_model(Students)
    ]
  end

  it "renders a list of students" do
    render
  end
end
