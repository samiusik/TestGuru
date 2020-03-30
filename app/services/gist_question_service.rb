class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title).to_s,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end


  class ResultObject

    def initialize(response = nil)
      @response = response
    end

    def success?
      html_url.present?
    end

    def html_url
      @response&.html_url
    end
  end
end
