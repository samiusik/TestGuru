class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show update destroy edit]
  before_action :find_test, only: %i[index new create update destroy]

  def show
  end 

  def new
    @question = @test.questions.new
  end

  def edit
  end
  
  def create
    @question = @test.questions.new(question_params)
    
    if @question.save
     redirect_to @question
    else
      render :new
    end
    #@question = @test.questions.create(params.require(:question).permit(:title, :level))
    #render plain: @question.inspect
  end

  def destroy
    @question.destroy
    #redirect_to action: :index
  end

  def update
    if @question.update
      redirect_to @question
    else
      redirect_to action: :edit
    end
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

  def question_params
    params.require(:question).permit(:title)
  end

end
