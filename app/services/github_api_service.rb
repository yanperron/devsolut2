require "open-uri"
require "json"


class GithubApiService

  GITHUB_URL = "https://api.github.com/orgs/:github_account"
  PAGE_REGEX = /github.com\/(.*)/


  def initialize(github_account)
    @github_account = extract_account_from_url(github_account)
    @base_url = GITHUB_URL.gsub(/:github_account/, @github_account)

    organisation_data()
    member_data()
    repos_data()

  end


  def repos_public
    public_repos = @organisation_data["public_repos"]
  end

  def total_stars
    stars = 0
    @repos_data.each do |repo|
      stars += repo['stargazers_count']
    end
    return stars
  end

  def total_members
    @member_data.count
  end

  def languages
    languages = {}

    @repos_data.each do |repo|
      # chope les codes dans repo["languages_url"]
      data = open_and_parse(repo["languages_url"])
      # ajouter ces codes aux précédent code
      p repo["languages_url"]
      p data
      languages.merge!(data){|key, oldval, newval| newval + oldval}
    end

    return languages
  end



  private

  def organisation_data
    api_url = @base_url.gsub(/:path/, "")
    @organisation_data = open_and_parse(api_url) || []
  end

  def member_data
    api_url = @base_url.gsub(/:path/, "/members")
    @member_data = open_and_parse(api_url) || []
  end

  def repos_data
    api_url = @organisation_data["repos_url"]
    @repos_data = open_and_parse(api_url) || []
  end

  def extract_account_from_url(url)
    if url.match(PAGE_REGEX).length >0
      return url.match(PAGE_REGEX)[1].gsub(/\//, "")
    end
  end

  def open_and_parse(url)
    begin
    open(url, :http_basic_authentication=> [ ENV["GITHUB_ID"], ENV["GITHUB_SECRET"] ] ) do |stream|
      return JSON.parse(stream.read)
    end

    rescue => e
      puts e
    end

  end


end
