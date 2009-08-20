require File.dirname(__FILE__) + '/../spec_helper'

describe SubjectsController do
  before(:each) do
    @subject = mock_model(Subject, :to_param => '1')
    @student = mock_model(Student, :subjects => [@subject], :to_param => '2')
    Student.stub!(:find).with('2').and_return(@student)
  end

  describe "handling GET /students/:student_id/subjects" do
    before(:each) do
      @student.subjects.stub!(:find).with(:all).and_return([@subject])
    end
    def do_get
      get :index, :student_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should assign the found student for the view" do
      do_get
      assigns[:student].should == @student
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end

    it "should find all subjects owned by student" do
      @student.subjects.stub!(:find).with(:all).and_return([@subject])
      do_get
    end

    it "should assign the found subjects for the view" do
      do_get
      assigns[:subjects].should == [@subject]
    end
  end

  describe "handling GET /students/:student_id/subjects.xml" do

    before(:each) do
      @student.subjects.stub!(:find).and_return([@subject])
    end

    def do_get
      @student.subjects.stub!(:to_xml).and_return("XML")
      @subject.stub!(:to_xml).and_return("XML")
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index, :student_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all subjects" do
      @student.subjects.should_receive(:find).and_return([@subject])
      do_get
    end

    it "should render the found subjects as xml" do
      @subject.should_receive(:to_xml).and_return("XML")
      do_get
    end
  end

  describe "handling GET /students/:student_id/subjects/1" do

    before(:each) do
      @student.subjects.stub!(:find).with('1').and_return(@subject)
    end

    def do_get
      get :show, :student_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render show template" do
      do_get
      response.should render_template('show')
    end

    it "should find the subject requested" do
      @student.subjects.stub!(:find).with('1').and_return(@subject)
      do_get
    end

    it "should assign the found subject for the view" do
      do_get
      assigns[:subject].should equal(@subject)
    end

    it "should assign the found student for the view" do
      do_get
      assigns[:student].should == @student
    end

  end

  describe "handling GET /students/:student_id/subjects/1.xml" do

    before(:each) do
      @student.subjects.stub!(:find).with('1').and_return(@subject)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :student_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find the subject requested" do
      @student.subjects.stub!(:find).with('1').and_return(@subject)
      do_get
    end

    it "should render the found subject as xml" do
      @subject.stub!(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /students/:student_id/subjects/new" do

    before(:each) do
      @student.subjects.stub!(:build).and_return(@subject)
    end

    def do_get
      get :new, :student_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render new template" do
      do_get
      response.should render_template('new')
    end

    it "should create an new subject" do
      @student.subjects.should_receive(:build).and_return(@subject)
      do_get
    end

    it "should not save the new subject" do
      @subject.should_not_receive(:save)
      do_get
    end

    it "should assign the new subject for the view" do
      do_get
      assigns[:subject].should equal(@subject)
    end

    it "should assign the Student for the view" do
      do_get
      assigns[:student].should equal(@student)
    end
  end

  describe "handling GET /students/:student_id/subjects/1/edit" do

    before(:each) do
      @student.subjects.stub!(:find).and_return(@subject)
    end

    def do_get
      get :edit, :student_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end

    it "should find the subject requested" do
      @student.subjects.should_receive(:find).with('1').and_return(@subject)
      do_get
    end

    it "should assign the found Subject for the view" do
      do_get
      assigns[:subject].should equal(@subject)
    end

    it "should assign the Student for the view" do
      do_get
      assigns[:student].should equal(@student)
    end
  end

  describe "handling POST /students/:student_id/subjects" do

    before(:each) do
      @student.subjects.stub!(:build).and_return(@subject)
    end

    describe "with successful save" do

      def do_post
        @subject.should_receive(:save).and_return(true)
        post :create, :student_id => '2', :subject => {}
      end

      it "should create a new subject" do
        @student.subjects.should_receive(:build).with({}).and_return(@subject)
        do_post
      end

      it "should redirect to the new subject" do
        do_post
        response.should redirect_to(student_subjects_path(@student))
      end

    end

    describe "with failed save" do

      def do_post
        @subject.should_receive(:save).and_return(false)
        post :create, :student_id => '2', :subject => {}
      end

      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end

    end
  end

  describe "handling PUT /students/:student_id/subjects/1" do

    before(:each) do
      @student.subjects.stub!(:find).and_return(@subject)
    end

    describe "with successful update" do

      def do_put
        @subject.should_receive(:update_attributes).and_return(true)
        put :update, :student_id => '2', :id => '1'
      end

      it "should find the subject requested" do
        @student.subjects.should_receive(:find).with('1').and_return(@subject)
        do_put
      end

      it "should update the found subject" do
        do_put
        assigns(:subject).should equal(@subject)
      end

      it "should assign the found subject for the view" do
        do_put
        assigns(:subject).should equal(@subject)
      end

      it "should assign the student for the view" do
        do_put
        assigns(:student).should equal(@student)
      end

      it "should redirect to the subject" do
        do_put
        response.should redirect_to(student_subject_url(@student, @subject))
      end

    end

    describe "with failed update" do

      def do_put
        @subject.should_receive(:update_attributes).and_return(false)
        put :update, :student_id => '2', :id => '1'
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /students/:student_id/subjects/1" do

    before(:each) do
      @student.subjects.stub!(:find).and_return(@subject)
      @subject.stub!(:destroy).and_return(true)
    end

    def do_delete
      delete :destroy, :student_id => '2', :id => '1'
    end

    it "should find the subject requested" do
      @student.subjects.should_receive(:find).with('1').and_return(@subject)
      do_delete
    end

    it "should call destroy on the found subject" do
      @subject.should_receive(:destroy)
      do_delete
    end

    it "should redirect to the student's subjects list" do
      do_delete
      response.should redirect_to(student_subjects_url(@student))
    end
  end
end
