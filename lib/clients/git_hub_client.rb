class GitHubClient

  def initialize
    @octokit_client = setup_client
  end

  def create_gist(params)
    @octokit_client.create_gist(params)
  end

  def last_response
    @octokit_client.last_response
  end
  
  private

  def setup_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
