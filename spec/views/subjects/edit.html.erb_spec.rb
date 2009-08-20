require File.dirname(__FILE__) + '/../../spec_helper'

describe "/subjects/edit.html.erb" do
  include SubjectsHelper
  
  before do
    @subject = mock_model(Subject)
    @student = mock_model(Student)
    @subject.stub!(:name).and_return("MyString")
    assigns[:subject] = @subject
    assigns[:student] = @student
  end

  it "should render edit form" do
    render "/subjects/edit.html.erb"
    
    response.should have_tag("form[action=#{student_subject_path(@student, @subject)}][method=post]") do
      with_tag('div[style=?]', "margin:0;padding:0") do
        with_tag('input[name=_method][type=hidden][value=put]')
      end
      with_tag('input#subject_name[name=?]', "subject[name]")
    end
  end
end


