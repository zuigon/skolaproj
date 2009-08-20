require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/edit.html.erb" do
  include StudentsHelper

  before(:each) do
    assigns[:students] = @students = stub_model(Students,
      :new_record? => false
    )
  end

  it "renders the edit students form" do
    render

    response.should have_tag("form[action=#{students_path(@students)}][method=post]") do
    end
  end
end
