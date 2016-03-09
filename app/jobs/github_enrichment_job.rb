require 'json'
require 'open-uri'

class GithubEnrichmentJob < ApplicationJob
  queue_as :default


  def perform(agence_id)

     agency = Agency.find(agence_id)
     github_account = agency.github_account

     api = GithubApiService.new(github_account)

     agency.repos_public = api.repos_public
     agency.total_stars = api.total_stars
     agency.total_members = api.total_members

     agency.save

  end


end
