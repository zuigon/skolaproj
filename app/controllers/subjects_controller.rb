class SubjectsController < ApplicationController
  
  protected
  
  # The nested resource owner.
  def student
    @student ||= Student.find(params[:student_id])
  end
  
  public
  
  # GET /students/:student_id/subjects
  # GET /students/:student_id/subjects.xml
  def index
    @subjects = student.subjects.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subjects }
    end
  end

  # GET /students/:student_id/subjects/1
  # GET /students/:student_id/subjects/1.xml
  def show
    @subject = student.subjects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /students/:student_id/subjects/new
  # GET /students/:student_id/subjects/new.xml
  def new
    @subject = student.subjects.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /students/:student_id/subjects/edit
  def edit
    @subject = student.subjects.find(params[:id])
  end

  # POST /students/:student_id/subjects
  # POST /students/:student_id/subjects.xml
  def create
    @subject = student.subjects.build(params[:subject])

    respond_to do |format|
      if @subject.save
        flash[:notice] = 'Subject was successfully created.'
        format.html { redirect_to(student_subject_url(student, @subject)) }
        format.xml  { render :xml => @subject, :status => :created, :location => student_subject_path(student, @subject) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/:student_id/subjects/1
  # PUT /students/:student_id/subjects/1.xml
  def update
    @subject = student.subjects.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        flash[:notice] = 'Subject was successfully updated.'
        format.html { redirect_to(student_subject_url(student, @subject)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/:student_id/subjects/1
  # DELETE /students/:student_id/subjects/1.xml
  def destroy
    @subject = student.subjects.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to(student_subjects_path(student)) }
      format.xml  { head :ok }
    end
  end
end
