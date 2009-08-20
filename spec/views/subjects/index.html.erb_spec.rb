require File.dirname(__FILE__) + '/../../spec_helper'

describe "/subjects/index.html.erb" do
  include SubjectsHelper
  
  before(:each) do
    subject_98 = mock_model(Subject)
    subject_98.should_receive(:name).and_return("MyString")
    subject_99 = mock_model(Subject)
    subject_99.should_receive(:name).and_return("MyString")

    @student = mock_model(Student)
    assigns[:subjects] = [subject_98, subject_99]
    assigns[:student] = @student
  end

  it "should render list of subjects" do
    render "/subjects/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

