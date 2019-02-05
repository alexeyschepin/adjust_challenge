class GithubService

  def initialize
    @client ||= Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def search_repos(params = {})
    search = params.delete(:search)
    @client.search_repositories(search, params)
  end
end
