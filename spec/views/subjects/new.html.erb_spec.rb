require File.dirname(__FILE__) + '/../../spec_helper'

describe "/subjects/new.html.erb" do
  include SubjectsHelper
  
  before(:each) do
    @subject = mock_model(Subject)
    @subject.stub!(:new_record?).and_return(true)
    @student = mock_model(Student)
    @subject.stub!(:name).and_return("MyString")
    assigns[:subject] = @subject
    assigns[:student] = @student    
  end

  it "should render new form" do
    render "/subjects/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", student_subjects_path(@student)) do
      with_tag('input[name=_method][type=hidden][value=put]', :count => 0)
      with_tag("input#subject_name[name=?]", "subject[name]")
    end
  end
end


