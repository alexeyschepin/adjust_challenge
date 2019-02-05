require 'test_helper'

class GithubServiceTest < ActiveJob::TestCase
  test 'search repos' do
    Octokit::Client.any_instance.expects(:search_repositories).with('ahoj', page: 1, per_page: 10)

    GithubService.new.search_repos(search: 'ahoj', page: 1, per_page: 10)
  end
end