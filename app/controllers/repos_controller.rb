class ReposController < ApplicationController
  PER_PAGE = 10
  DEFAULT_PAGE = 1
  MAX_TOTAL_ITEMS = 1000

  # GET /repos
  def index
    @search = search_params[:search]
    return @repos if @search.blank?

    page = search_params.fetch(:page, DEFAULT_PAGE).to_i
    result = GithubService.new.search_repos(search: @search, page: page, per_page: PER_PAGE)

    total_count = [result[:total_count], MAX_TOTAL_ITEMS].min
    @repos = WillPaginate::Collection.create(page, PER_PAGE, total_count) do |pager|
      pager.replace(result[:items])
    end
  end

  private

  def search_params
    params.permit(:search, :page)
  end
end
