class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :validate_question_present, only: %i[show]

  def show
    
  end

  def result
    
  end

  def update
    if params[:answer_ids].present?
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      flash[:notice] = t('.failure')
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create(url: result.html_url, question: @test_passage.current_question, user: current_user)
      flash[:notice] = t(
          '.success',
          { link: view_context.link_to('Gist', result.html_url, target: '_blank') }
      )
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def validate_question_present
    unless @test_passage.test.questions.present?
      flash[:alert] = t('.no_questions')
      redirect_to tests_path
    end
  end

  def create_gist!(gist_url)
    current_user.gists.create(question: @tests_passages.current_question, url: gist_url)
  end

end
