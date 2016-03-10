require 'json'
require 'open-uri'

class GithubEnrichmentJob < ApplicationJob
  queue_as :default


  def perform(agence_id)

     agency = Agency.find(agence_id)
     github_account = agency.github_account

     api = GithubApiService.new(github_account)

    report = GithubReport.new
    report.agency = agency
    report.repos_public = api.repos_public
    report.total_stars = api.total_stars
    report.total_members = api.total_members
    report.languages = api.languages
    report.save

  end


  private


end
