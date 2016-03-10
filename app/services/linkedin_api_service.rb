require 'open-uri'
require 'nokogiri'


class LinkedinApiService
  LINKEDIN_URL = "https://www.linkedin.com/company/:company_id"

  def initialize(company_id)
    url = LINKEDIN_URL.gsub(/:company_id/, company_id)
    html_file = open(url)
    @html_doc = Nokogiri::HTML(html_file)
  end


  def company_name
    text_from_css('.left-entity h1 span')
  end

  def company_size
    text_from_css('.company-size')
  end

  def specialities
    array_from_css('.specialties p')
  end

  def website
    text_from_css('.website a')
  end

  def industry
    text_from_css('.industry p')
  end

  def type
    text_from_css('.type p')
  end

  def creation_date
    text_from_css('.founded p')
  end

  def address
    address= []
    address << text_from_css('.street-address')
    address << text_from_css('.locality')
    address << text_from_css('.region')
    address << text_from_css('.postal-code')
    address << text_from_css('.country-name')
    address.join(' ')
  end



  private

  def text_from_css(element)
    @html_doc.search(element)[0].text.strip
  end

  def array_from_css(element)
    @html_doc.search(element)[0].text.split(',').map{ |s| s.strip }
  end





end
