require 'test_helper'

class ReposControllerTest < ActionDispatch::IntegrationTest
  test 'should not call github for empty term' do
    GithubService.any_instance.expects(:search_repos).never

    get repos_url
    assert_response :success
  end

  test 'should call github with given term' do
    json_file = file_fixture('github_response.json').read
    github_response = JSON.parse(json_file, object_class: OpenStruct)
    GithubService.any_instance.expects(:search_repos).returns(github_response)

    get repos_url, params: { search: 'ahoj' }
    assert_response :success
  end
end
