require File.dirname(__FILE__) + '/../spec_helper'

describe SubjectsController do
  describe "route generation" do

    it "should map { :controller => 'subjects',  :action => 'index', :student_id => '2' } to /students/2/subjects" do
      route_for(:controller => "subjects",  :action => 'index', :student_id => '2').should == "/students/2/subjects"
    end

    it "should map { :controller => 'subjects',  :action => 'new', :student_id => '2' } to /students/2/subjects/new" do
      route_for(:controller => "subjects",  :action => 'new', :student_id => '2').should == "/students/2/subjects/new"
    end

    it "should map { :controller => 'subjects',  :action => 'show', :student_id => '2', :id => 1 } to /students/2/subjects/1" do
      route_for(:controller => "subjects",  :action => 'show', :student_id => '2', :id => 1).should == "/students/2/subjects/1"
    end

    it "should map { :controller => 'subjects',  :action => 'edit', :student_id => '2', :id => 1 } to /students/2/subjects/1/edit" do
      route_for(:controller => "subjects",  :action => 'edit', :student_id => '2', :id => 1).should == "/students/2/subjects/1/edit"
    end

    it "should map { :controller => 'subjects',  :action => 'update', :student_id => '2', :id => 1} to /students/2/subjects/1" do
      route_for(:controller => "subjects",  :action => 'update', :student_id => '2', :id => 1).should == "/students/2/subjects/1"
    end

    it "should map { :controller => 'subjects',  :action => 'destroy', :student_id => '2', :id => 1} to /students/2/subjects/1" do
      route_for(:controller => "subjects",  :action => 'destroy', :student_id => '2', :id => 1).should == "/students/2/subjects/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'subjects', action => 'index', :student_id => '2' } from GET /students/2/subjects" do
      params_from(:get, "/students/2/subjects").should == {:controller => "subjects",  :action => 'index', :student_id => '2'}
    end

    it "should generate params { :controller => 'subjects', action => 'new', :student_id => '2' } from GET /students/2/subjects/new" do
      params_from(:get, "/students/2/subjects/new").should == {:controller => "subjects",  :action => 'new', :student_id => '2'}
    end

    it "should generate params { :controller => 'subjects', action => 'create', :student_id => '2' } from POST /students/2/subjects" do
      params_from(:post, "/students/2/subjects").should == {:controller => "subjects",  :action => 'create', :student_id => '2'}
    end

    it "should generate params { :controller => 'subjects', action => 'show', :student_id => '2', id => '1' } from GET /students/2/subjects/1" do
      params_from(:get, "/students/2/subjects/1").should == {:controller => "subjects",  :action => 'show', :student_id => '2', :id => "1"}
    end

    it "should generate params { :controller => 'subjects', action => 'edit', :student_id => '2', id => '1' } from GET /students/2/subjects/1;edit" do
      params_from(:get, "/students/2/subjects/1/edit").should == {:controller => "subjects",  :action => 'edit', :student_id => '2', :id => "1"}
    end

    it "should generate params { :controller => 'subjects', action => 'update', :student_id => '2', id => '1' } from PUT /students/2/subjects/1" do
      params_from(:put, "/students/2/subjects/1").should == {:controller => "subjects",  :action => 'update', :student_id => '2', :id => "1"}
    end

    it "should generate params { :controller => 'subjects', action => 'destroy', :student_id => '2', id => '1' } from DELETE /students/2/subjects/1" do
      params_from(:delete, "/students/2/subjects/1").should == {:controller => "subjects",  :action => 'destroy', :student_id => '2', :id => "1"}
    end
  end
end
