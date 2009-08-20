require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/new.html.erb" do
  include StudentsHelper

  before(:each) do
    assigns[:students] = stub_model(Students,
      :new_record? => true
    )
  end

  it "renders new students form" do
    render

    response.should have_tag("form[action=?][method=post]", students_path) do
    end
  end
end
