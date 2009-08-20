class SubjectsController < ApplicationController

  before_filter :get_student
  
  private
  def get_student
    @student = Student.find(params[:student_id])
  end

  def index
    #@subjects = Subject.all
    @subjects = @student.subjects.find(:all)

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @subjects }
    # end
  end

  def show
    @subject = Subject.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @subject }
    # end
  end

  def new
    # @subject = @student.subjects.new
    @subject = Subject.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @subject }
    # end
  end

  def edit
    #@student = Student.find(params[:student_id])
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        flash[:notice] = 'Subject was successfully created.'
        format.html { redirect_to(@student) }
        format.xml  { render :xml => @subject, :status => :created, :location => @subject }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        flash[:notice] = 'Subject was successfully updated.'
        format.html { redirect_to(@subject) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @subject = @student.subjects.find(params[:id])
    #@subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to(student_subjects_url) }
      format.xml  { head :ok }
    end
  end

end
