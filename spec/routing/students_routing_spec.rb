require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StudentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "students", :action => "index").should == "/students"
    end

    it "maps #new" do
      route_for(:controller => "students", :action => "new").should == "/students/new"
    end

    it "maps #show" do
      route_for(:controller => "students", :action => "show", :id => "1").should == "/students/1"
    end

    it "maps #edit" do
      route_for(:controller => "students", :action => "edit", :id => "1").should == "/students/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "students", :action => "create").should == {:path => "/students", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "students", :action => "update", :id => "1").should == {:path =>"/students/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "students", :action => "destroy", :id => "1").should == {:path =>"/students/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/students").should == {:controller => "students", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/students/new").should == {:controller => "students", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/students").should == {:controller => "students", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/students/1").should == {:controller => "students", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/students/1/edit").should == {:controller => "students", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/students/1").should == {:controller => "students", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/students/1").should == {:controller => "students", :action => "destroy", :id => "1"}
    end
  end
end
