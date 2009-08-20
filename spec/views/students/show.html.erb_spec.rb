require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/show.html.erb" do
  include StudentsHelper
  before(:each) do
    assigns[:students] = @students = stub_model(Students)
  end

  it "renders attributes in <p>" do
    render
  end
end
