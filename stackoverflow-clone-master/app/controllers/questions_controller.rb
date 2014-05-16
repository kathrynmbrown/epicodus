class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      respond_to do |format|
        format.html { redirect_to questions_url }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

   def destroy
    @question = Question.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

private

  def question_params
    params.require(:question).permit(:content,
                                 :user_id,
                                 :answer_id)
  end
end
