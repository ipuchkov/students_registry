class StudentsController < ApplicationController
  before_filter :load_students, :only => [:index, :create]

  def index
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

  private

  def student_params
    params.require(:student).permit(:name, :surname)
  end

  def load_students
    @students = Student.ordered
  end
end
