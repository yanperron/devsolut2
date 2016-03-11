class Agency < ApplicationRecord

  mount_uploader :photo, PhotoUploader


  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :quotes
  has_many :linkedin_reports
  has_many :github_reports

  after_save :enrich_github
  after_save :enrich_linkedin

  def review_mean
   if self.reviews.length == 0
      0
    else
      sum = self.reviews.reduce(0){|memo, review| memo+=review.star}
      sum.fdiv(self.reviews.count)
   end
  end




  def short_description
    "#{self.description[0..140]} ..." unless self.description.nil?
  end


  private


  def enrich_github
    unless self.github_account.nil?
      GithubEnrichmentJob.perform_later(self.id)
    end
  end


  def enrich_linkedin
    unless self.linkedin_account.nil?
      LinkedinEnrichmentJob.perform_later(self.id)
    end
  end

end
