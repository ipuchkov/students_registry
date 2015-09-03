class StudentsController < ApplicationController
  before_filter :load_students, :only => [:index, :create, :destroy, :update]

  def index
    @courses = Course.ordered
    respond_to do |format|
      format.html
    end
  end

  def new
    @student = Student.new

    respond_to do |format|
      format.js
    end
  end

  def create
    respond_to do |format|
      format.js do
        @student = Student.new(student_params)
        if @student.save
          render :create
        else
          render :new
        end
      end
    end
  end

  def show
    respond_to do |format|
      format.js do
        @student = Student.find(params[:id])
      end
    end
  end

  def edit
    respond_to do |format|
      format.js do
        @student = Student.find(params[:id])
      end
    end
  end

  def update
    respond_to do |format|
      format.js do
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
          render :update
        else
          render :edit
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.js do
        @student = Student.find(params[:id])
        @student.destroy
      end
    end
  end

  def top
    respond_to do |format|
      format.js do
        @course = Course.find(params[:course_id])
        @students = @course.students.top(params[:semester_number])
      end
    end
  end

  def duplicated_ip
    respond_to do |format|
      format.js do
        @students = Student.duplicate_ip_with_characteristic
      end
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :surname, :email, :ip, :registration_time, :birthdate, :group_id)
  end

  def load_students
    @students = Student.ordered
  end
end
