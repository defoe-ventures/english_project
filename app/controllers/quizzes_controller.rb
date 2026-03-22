class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]

  # GET /quizzes or /quizzes.json
  def index
    
    admin_user = false
    @quizzes =  current_user == admin_user ? Quiz.all : current_user.quizzes
    @words = current_user == admin_user ? Word.all : current_user.words

  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @words = current_user.words.sample(5).shuffle
    @answer_letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    @quiz = Quiz.new#(words: @words.pluck(:id))
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create

    grades = quiz_params[:key].map.with_index{|correct_answer, x| correct_answer == quiz_params[:answers][x].downcase}
    grade_tally = grades.tally

    score = ((grade_tally[true].to_f / quiz_params[:key].count.to_f) * 100)
    @quiz = Quiz.new(quiz_params.except(:answers, :key))

    @quiz.score = score

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find_by(id: params[:id])

      unless @quiz
        redirect_to root_path and return
      end
      
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:user_id, :score, words: [], answers: [], key: [])
    end
end
