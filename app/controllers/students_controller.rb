class StudentsController < ApplicationController
  def index
    Student.find_or_create_by(name: "StudentA", level: "C+", invoicee: "yes", schedule: "2x weekly")
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def create
    student_params = params.require(:name)

    puts student_params
    new_student = Student.new(name: student_params)



    if new_student.save!
      redirect_to '/students'
    end


  end

  def update
    puts params
    student = Student.find_by(id: params[:id])



    if student.update!(name: params[:name], level: params[:level])
      redirect_to '/students'
    end

  end

  def destroy
  end
end
