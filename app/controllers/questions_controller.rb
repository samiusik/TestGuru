class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[index new create]

  def index
    @questions = @test.questions
  end

  def show 

  end 

  def new
    @question = @test.question.new
  end

  def destroy
    @question.destroy
    #redirect_to action: :index
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def rescue_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end

end
