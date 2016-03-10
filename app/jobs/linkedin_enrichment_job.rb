class LinkedinEnrichmentJob < ApplicationJob
  queue_as :default

  def perform(agency_id)
    # Do something later
    agency = Agency.find(agency_id)
    linkedin_url = agency.linkedin_account
    linkedin_account = extract_account(linkedin_url)

    api = LinkedinApiService.new(linkedin_account)

    report = LinkedinReport.new
    report.agency = agency
    report.size = api.company_size
    report.specialities = api.specialities.join(",")
    report.industry = api.industry
    report.website = api.website
    report.create_date = api.creation_date
    report.address= api.address

    report.save

  end


  private

  def extract_account(linkedin_url)
    if linkedin_url.match("www") && linkedin_url.match(/company\/(.*)/).length > 0
      return linkedin_url.match(/company\/(.*)/)[1].gsub(/\//, "")
    end
  end

end
