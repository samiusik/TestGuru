class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    
  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show 
    end   
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question, client: GitHubClient.new)
    response = service.call

    if service.client.success?
      
      html_url = response[:html_url]
      question.gists.create(user: current_user, url: html_url)
      flash[:notice] = t(
          '.success',
          { link: view_context.link_to('Gist', html_url, target: '_blank') }
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

end
