class StudentsController < ApplicationController
    def create
        instructor = Instructor.find(params[:instructor_id])
        student = instructor.students.build(student_params)
        
        if student.save
          render json: student, status: :created
        else
          render json: { error: student.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Instructor not found' }, status: :not_found
      end

    def index
        students = Student.all
        render json: students
      end
    
      def show
        student = Student.find(params[:id])
        render json: student
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Student not found' }, status: :not_found
      end

    def update
        student = Student.find(params[:id])
        
        if student.update(student_params)
          render json: student
        else
          render json: { error: student.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Student not found' }, status: :not_found
      end

    def destroy
      student = Student.find(params[:id])
      student.destroy
      render json: { message: 'Student deleted successfully' }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Student not found' }, status: :not_found
    end

    private

    def student_params
      params.require(:student).permit(:name, :major, :age)
    end
    
end
  