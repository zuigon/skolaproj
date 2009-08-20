require File.dirname(__FILE__) + '/../../spec_helper'

describe "/subjects/show.html.erb" do
  include SubjectsHelper
  
  before(:each) do
    @subject = mock_model(Subject)
    @student = mock_model(Student)
    @subject.stub!(:name).and_return("MyString")
    assigns[:student] = @student    
    assigns[:subject] = @subject
  end

  it "should render attributes in <p>" do
    render "/subjects/show.html.erb"
    response.should have_text(/MyString/)
  end
end

